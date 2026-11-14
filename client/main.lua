--[[
    qbx_hint - client
    Author: supernoob indonesia

    Each point has its own UI state: 'none' | 'marker' | 'hint'.
    Multiple markers can be visible at once; only ONE hint panel is shown
    (the closest point inside its nearDistance wins).
]]

local POS_EPSILON = 0.0015

local points = {}       -- uid -> lib.point
local nextUid = 0
local hintOwner = nil   -- point that currently owns the hint panel
local globalEnabled = true

local function getTheme()
    return Config.Themes[Config.Theme] or Config.Themes.dark
end

---------------------------------------------------------------------
-- NUI helpers
---------------------------------------------------------------------

local function sendState(point, mode)
    if mode == 'none' then
        SendNUIMessage({ action = 'set', id = point.uid, state = 'none' })
        return
    end

    local d = point.data
    SendNUIMessage({
        action  = 'set',
        id      = point.uid,
        state   = mode,
        mode    = Config.Mode,
        twoTone = d.twoTone == nil and Config.TwoTone or d.twoTone,
        theme   = getTheme(),
        icon    = d.icon or Config.DefaultIcon,
        color   = d.color,
        color2  = d.color2,
        title   = d.title,
        text    = d.text,
        key     = d.key,
        subtext = d.subtext,
    })
end

local function setMode(point, mode)
    if point.uiMode == mode then return end

    point.uiMode = mode
    point.lastX, point.lastY, point.lastDist = -1.0, -1.0, -1
    point.offScreen = false

    if mode == 'hint' then
        hintOwner = point
    elseif hintOwner == point then
        hintOwner = nil
    end

    sendState(point, mode)
end

local function setOffScreen(point, value)
    if point.offScreen == value then return end
    point.offScreen = value
    SendNUIMessage({ action = 'visibility', id = point.uid, hidden = value })
end

-- Force a point to re-send its content (used after updates)
local function refresh(point)
    local mode = point.uiMode
    if mode == 'none' then return end
    point.uiMode = nil
    setMode(point, mode)
end

---------------------------------------------------------------------
-- Visibility rules
---------------------------------------------------------------------

-- vehicle: nil = follow Config.HideInVehicle, 'any' = always,
--          'only' = in vehicle only, 'never' = on foot only
local function vehicleAllowed(d)
    local inVehicle = cache.vehicle and true or false

    if d.vehicle == 'any' then return true end
    if d.vehicle == 'only' then return inVehicle end
    if d.vehicle == 'never' then return not inVehicle end

    return not (Config.HideInVehicle and inVehicle)
end

local function isVisible(point)
    local d = point.data
    if not globalEnabled or d.enabled == false then return false end
    if d.canShow and not d.canShow() then return false end
    return vehicleAllowed(d)
end

---------------------------------------------------------------------
-- Point logic
---------------------------------------------------------------------

local function onNearby(self)
    if not isVisible(self) then
        setMode(self, 'none')
        return
    end

    local d = self.data
    local dist = self.currentDistance
    local want = 'marker'

    if dist <= d.nearDistance then
        if not hintOwner or hintOwner == self or dist < hintOwner.currentDistance then
            if hintOwner and hintOwner ~= self then setMode(hintOwner, 'marker') end
            want = 'hint'
        end
    end

    setMode(self, want)

    -- Fixed hint panel needs no position updates
    if want == 'hint' and Config.Mode ~= '3d' then return end

    local c = self.coords
    local z = c.z + (want == 'hint' and d.offsetZ or d.markerOffsetZ)
    local onScreen, x, y = GetScreenCoordFromWorldCoord(c.x, c.y, z)

    if not onScreen then
        setOffScreen(self, true)
        return
    end
    setOffScreen(self, false)

    if math.abs(x - self.lastX) > POS_EPSILON or math.abs(y - self.lastY) > POS_EPSILON then
        self.lastX, self.lastY = x, y
        SendNUIMessage({ action = 'pos', id = self.uid, x = x, y = y })
    end

    if Config.ShowDistance and want == 'marker' then
        local meters = math.floor(dist + 0.5)
        if meters ~= self.lastDist then
            self.lastDist = meters
            SendNUIMessage({ action = 'dist', id = self.uid, value = meters })
        end
    end
end

local function toVector3(coords)
    local t = type(coords)
    if t == 'vector3' or t == 'vector4' then
        return vec3(coords.x, coords.y, coords.z)
    end
    if t == 'table' then
        return vec3(coords.x or coords[1], coords.y or coords[2], coords.z or coords[3])
    end
    error('qbx_hint: invalid coords', 3)
end

local DEFAULTS = {
    farDistance   = 15.0,
    nearDistance  = 2.5,
    markerOffsetZ = 0.75,
    offsetZ       = 0.45,
}

local function applyDefaults(cfg)
    local def = Config.Defaults or DEFAULTS
    for key, fallback in pairs(DEFAULTS) do
        cfg[key] = tonumber(cfg[key]) or tonumber(def[key]) or fallback
    end
    return cfg
end

local function createPoint(cfg, resource, forcedUid)
    assert(type(cfg) == 'table', 'qbx_hint: point data must be a table')

    local uid = forcedUid
    if not uid then
        nextUid += 1
        uid = nextUid
    end

    cfg = applyDefaults(cfg)
    cfg.coords = toVector3(cfg.coords)
    cfg.resource = resource or cfg.resource

    local point = lib.points.new({
        coords   = cfg.coords,
        distance = cfg.farDistance,
        radius   = cfg.farDistance, -- newer ox_lib grid reads `radius`
        data     = cfg,
        uid      = uid,
        uiMode   = 'none',
        lastX    = -1.0,
        lastY    = -1.0,
        lastDist = -1,
    })

    function point:onExit()
        setMode(self, 'none')
    end

    point.nearby = onNearby
    points[uid] = point

    return uid
end

local function removePoint(uid)
    local point = points[uid]
    if not point then return false end

    setMode(point, 'none')
    point:remove()
    points[uid] = nil

    return true
end

-- Coords / distance changes need a new lib.point, so we recreate it with the same uid
local function updatePoint(uid, changes)
    local point = points[uid]
    if not point or type(changes) ~= 'table' then return false end

    local d = point.data
    for k, v in pairs(changes) do d[k] = v end

    if changes.coords or changes.farDistance then
        setMode(point, 'none')
        point:remove()
        points[uid] = nil
        createPoint(d, d.resource, uid) -- keep the same id
        return true
    end

    refresh(point)
    return true
end

---------------------------------------------------------------------
-- Static points from config
---------------------------------------------------------------------

for _, cfg in ipairs(Config.Points or {}) do
    createPoint(cfg, GetCurrentResourceName())
end

---------------------------------------------------------------------
-- Exports
---------------------------------------------------------------------

--- Add a hint point. Returns its id.
exports('AddPoint', function(data)
    return createPoint(data, GetInvokingResource())
end)

--- Remove a hint point by id.
exports('RemovePoint', removePoint)

--- Change fields of an existing point (title, text, icon, color, coords, ...).
exports('UpdatePoint', updatePoint)

--- Enable / disable a single point without removing it.
exports('SetPointEnabled', function(uid, enabled)
    return updatePoint(uid, { enabled = enabled and true or false })
end)

--- Check if a point exists.
exports('HasPoint', function(uid)
    return points[uid] ~= nil
end)

--- Remove every point that was added by the calling resource.
exports('ClearPoints', function()
    local res = GetInvokingResource()
    for uid, point in pairs(points) do
        if point.data.resource == res then removePoint(uid) end
    end
end)

--- Show / hide all hints globally (e.g. during cutscenes, menus).
exports('SetEnabled', function(enabled)
    globalEnabled = enabled and true or false
    if not globalEnabled then
        for _, point in pairs(points) do setMode(point, 'none') end
    end
end)

exports('IsEnabled', function()
    return globalEnabled
end)

--- Returns the id of the point currently showing the hint panel (or nil).
exports('GetActivePoint', function()
    return hintOwner and hintOwner.uid or nil
end)

--- Switch theme at runtime ('dark', 'light', 'mono', 'custom', ...).
exports('SetTheme', function(name)
    if not Config.Themes[name] then return false end
    Config.Theme = name
    for _, point in pairs(points) do refresh(point) end
    return true
end)

---------------------------------------------------------------------
-- Cleanup points owned by a stopped resource
---------------------------------------------------------------------

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then return end
    for uid, point in pairs(points) do
        if point.data.resource == resource then removePoint(uid) end
    end
end)
