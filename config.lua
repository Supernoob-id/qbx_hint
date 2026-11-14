Config = {}

-- Hint panel position when close:
--   'fixed' : right-middle of the screen
--   '3d'    : floats above the point
Config.Mode = '3d'

-- Hide everything while the player is inside a vehicle
-- (a point can override this with `vehicle = 'any' | 'only' | 'never'`)
Config.HideInVehicle = true

-- Show distance (e.g. "12m") under the marker icon
Config.ShowDistance = true

-- Default icon when a point doesn't set one
Config.DefaultIcon = 'info'

-- Two-tone mode: marker ring, marker tip and the panel's left bar use a
-- gradient from `accent` to `accent2`. A point can override with `twoTone = true/false`.
Config.TwoTone = false

-- Default values used when a point (config or export) doesn't set them
Config.Defaults = {
    farDistance   = 15.0, -- marker icon visible within this range
    nearDistance  = 2.5,  -- closer than this: marker hides, hint panel shows
    markerOffsetZ = 0.75, -- marker height above coords
    offsetZ       = 0.45, -- hint panel height above coords (3d mode)
}

--[[
    THEME
    Pick a preset: 'dark', 'light', 'mono', 'custom', 'duo'
    Edit any value below to fine-tune. Colors accept hex, rgb() or rgba().
    A point's own `color` / `color2` (optional) override the theme accents for that point only.
    `accent2` is only used when two-tone is on (falls back to `accent`).
]]
Config.Theme = 'dark'

Config.Themes = {
    -- Black + gray (subtle)
    dark = {
        background = 'rgba(18, 18, 22, 0.90)',  -- panel & marker background
        text       = '#f2f2f2',                 -- title / main text
        subtext    = 'rgba(255, 255, 255, 0.65)', -- description text
        border     = 'rgba(255, 255, 255, 0.10)', -- panel outline
        accent     = '#9a9aa2',                 -- icon, marker ring, left bar
        iconBg     = 'rgba(255, 255, 255, 0.06)', -- square behind panel icon
        keyBg      = 'rgba(255, 255, 255, 0.10)', -- [ALT] key box
        keyBorder  = 'rgba(255, 255, 255, 0.25)',
        glow       = 'transparent',             -- marker glow, 'transparent' = off
    },

    -- White + gray
    light = {
        background = 'rgba(245, 245, 247, 0.94)',
        text       = '#1c1c20',
        subtext    = 'rgba(0, 0, 0, 0.60)',
        border     = 'rgba(0, 0, 0, 0.10)',
        accent     = '#6e6e76',
        iconBg     = 'rgba(0, 0, 0, 0.06)',
        keyBg      = 'rgba(0, 0, 0, 0.07)',
        keyBorder  = 'rgba(0, 0, 0, 0.20)',
        glow       = 'transparent',
    },

    -- Black + white (high contrast)
    mono = {
        background = 'rgba(10, 10, 10, 0.92)',
        text       = '#ffffff',
        subtext    = 'rgba(255, 255, 255, 0.75)',
        border     = 'rgba(255, 255, 255, 0.15)',
        accent     = '#ffffff',
        iconBg     = 'rgba(255, 255, 255, 0.10)',
        keyBg      = '#ffffff',
        keyBorder  = '#ffffff',
        keyText    = '#0a0a0a',                 -- optional: text color inside [ALT]
        glow       = 'transparent',
    },

    -- Your own colors (example: the original pink look)
    custom = {
        background = 'rgba(18, 18, 22, 0.92)',
        text       = '#ffffff',
        subtext    = 'rgba(255, 255, 255, 0.75)',
        border     = 'rgba(255, 255, 255, 0.08)',
        accent     = '#e83e8c',
        iconBg     = 'rgba(255, 255, 255, 0.06)',
        keyBg      = 'rgba(255, 255, 255, 0.12)',
        keyBorder  = 'rgba(255, 255, 255, 0.25)',
        glow       = 'rgba(232, 62, 140, 0.45)',
    },

    -- Two-tone example (set Config.TwoTone = true)
    duo = {
        background = 'rgba(14, 14, 20, 0.92)',
        text       = '#ffffff',
        subtext    = 'rgba(255, 255, 255, 0.72)',
        border     = 'rgba(255, 255, 255, 0.08)',
        accent     = '#3ea6ff',                 -- first tone
        accent2    = '#b44dff',                 -- second tone
        iconBg     = 'rgba(255, 255, 255, 0.06)',
        keyBg      = 'rgba(255, 255, 255, 0.12)',
        keyBorder  = 'rgba(255, 255, 255, 0.25)',
        glow       = 'rgba(62, 166, 255, 0.35)',
    },
}

--[[
    icon options:
      Built-in : 'car', 'boat', 'plane', 'key', 'wrench', 'shop', 'money',
                 'food', 'medical', 'police', 'info', 'garage', 'parking',
                 'laptop', 'box'
      Custom   : 'img:yourfile.png'  -> put the file in html/icons/
                 (png/svg/webp, ideally 64x64, transparent background)

    color / color2 (optional): override the theme accents for that point only.
    twoTone (optional)        : true/false, overrides Config.TwoTone.
    vehicle (optional)        : 'any' | 'only' | 'never' (default follows Config.HideInVehicle)
    farDistance / nearDistance / markerOffsetZ / offsetZ: optional, default from Config.Defaults
]]

Config.Points = {
    { -- PDM vehicle catalog monitor
        coords  = vec3(-55.58, -1097.2, 26.35),
        icon    = 'car',
        title   = 'Vehicle Catalog',
        text    = 'Look at the monitor and use',
        key     = 'ALT',
        subtext = 'to browse & buy vehicles',
    },
    { -- PDM sell material door
        coords  = vec3(-50.11, -1088.68, 26.73),
        icon    = 'money',
        title   = 'Sell Material',
        text    = 'Look at the door and use',
        key     = 'ALT',
        subtext = 'to sell material',
    },
    { -- La Puerta
        coords  = vec3(1073.305, -2275.494, -49.55),
        icon    = 'laptop',
        title   = 'Boss Menu',
        text    = 'Use',
        key     = 'ALT',
        subtext = 'on the laptop to open the management menu',
    },
    { -- La Puerta
        coords  = vec3(1091.27, -2284.45, -49.55),
        icon    = 'wrench',
        title   = 'Storage',
        text    = 'Use',
        key     = 'ALT',
        subtext = 'on the object to open the storage menu',
    },
    { -- La Puerta
        coords  = vec3(1098.741, -2279.385, -49.308),
        icon    = 'car',
        title   = 'Trailer',
        text    = 'Use',
        key     = 'ALT',
        subtext = 'on the trailer to take out trailer',
    },
    { -- Starter pack
        coords  = vec3(-1040.479126, -2731.582520, 20.164062),
        icon    = 'car',
        title   = 'Starterpack',
        text    = 'Use',
        key     = 'ALT',
        subtext = 'on NPC to take starterpack',
    },
    { -- Shop
        coords  = vec3(24.946, -1344.954, 29.312),
        icon    = 'shop',
        title   = 'Shop',
        text    = 'Use',
        key     = 'ALT',
        subtext = 'on Cashier to open shop',
    },
    { -- Sell point
        coords  = vec3(-350.296, -987.856, 31.000),
        icon    = 'shop',
        title   = 'Sell Point',
        text    = 'Use',
        key     = 'ALT',
        subtext = 'on Table to open sell point',
    },
    { -- Garage
        coords  = vec3(-336.4, -995.2, 29.39),
        icon    = 'garage',
        title   = 'Garage',
        text    = 'Use',
        key     = 'E',
        subtext = 'to store your vehicle',
    },
    -- Example: custom image (html/icons/burgershot.png)
    -- {
    --     coords  = vec3(-1193.0, -892.0, 14.0),
    --     icon    = 'img:burgershot.png',
    --     title   = 'Burger Shot',
    --     text    = 'Use', key = 'ALT', subtext = 'on the register to order',
    -- },
}
