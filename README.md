# qbx_hint

Lightweight world-space info hints for FiveM (Qbox / ox_lib).
Author: **supernoob indonesia**

> **Free for the Qbox community.** I've received a lot of resources from this
> community, so I want to give back what I can. Use it, modify it, share it.

- Far away: a floating marker icon (with optional distance).
- Close: a hint panel (fixed on screen or floating in 3D).
- Zero cost while outside a point's range (ox_lib points).
- Themes (`dark`, `light`, `mono`, `custom`, `duo`) and optional **two-tone** gradient accents.

## Requirements
- [ox_lib](https://github.com/overextended/ox_lib)

## Installation
1. Put `qbx_hint` in your resources folder.
2. Add `ensure qbx_hint` after `ox_lib` in `server.cfg`.
3. Edit `config.lua`.

## Two-tone mode
Set `Config.TwoTone = true` and give your theme an `accent2` (see the `duo` theme).
A point can override with `twoTone = true/false`, `color` and `color2`.

## Exports (client)

```lua
-- Add a point, returns its id
local id = exports.qbx_hint:AddPoint({
    coords   = vec3(-55.58, -1097.2, 26.35),
    icon     = 'car',            -- built-in name or 'img:file.png' (html/icons/)
    title    = 'Vehicle Catalog',
    text     = 'Look at the monitor and use',
    key      = 'ALT',
    subtext  = 'to browse & buy vehicles',

    -- optional
    color        = '#3ea6ff',
    color2       = '#b44dff',
    twoTone      = true,
    vehicle      = 'never',      -- 'any' | 'only' | 'never'
    farDistance  = 15.0,
    nearDistance = 2.5,
    markerOffsetZ = 0.75,
    offsetZ      = 0.45,
    canShow      = function() return true end, -- custom visibility check
})

exports.qbx_hint:UpdatePoint(id, { title = 'New title', icon = 'shop' })
exports.qbx_hint:SetPointEnabled(id, false)
exports.qbx_hint:HasPoint(id)          -- boolean
exports.qbx_hint:RemovePoint(id)
exports.qbx_hint:ClearPoints()         -- removes all points added by the calling resource

exports.qbx_hint:SetEnabled(false)     -- hide every hint (cutscenes, menus, ...)
exports.qbx_hint:IsEnabled()
exports.qbx_hint:GetActivePoint()      -- id of the point showing the hint panel, or nil
exports.qbx_hint:SetTheme('light')
```

Points added by another resource are removed automatically when that resource stops.

## Icons
Built-in: `car`, `boat`, `plane`, `key`, `wrench`, `shop`, `money`, `food`, `medical`,
`police`, `info`, `garage`, `parking`, `laptop`, `box`.

Built-in icons are Google Material Icons (Apache 2.0, free for commercial use).
For more, download an SVG from fonts.google.com/icons, put it in `html/icons/`
and use `icon = 'img:filename.svg'`.

## License
MIT - see [LICENSE](LICENSE). Credit is appreciated but not required.
