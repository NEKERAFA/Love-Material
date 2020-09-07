---
-- Icon manipulation
-- @module material.icons

return function ( material )

-- Loads icon codepoint
local _material_icons_codepoints = require (material._CONSTANTS .. ".codepoints")

-- Sets icon size
local _material_icons_size = 20

-- Loads icon font
local _material_icons_font = love.graphics.newFont(material._ASSETS .. "/fonts/MaterialIcons.ttf", _material_icons_size)

---
-- Gets the icon font
-- @function getFont
-- @return The icon font
local function _material_icons_getfont ()
    return _material_icons_font
end

---
-- Gets the size in pixels of the icons
-- @function getSize
-- @return The size in pixels
local function _material_icons_getsize ()
    return _material_icons_size
end

return {
    codepoints = _material_icons_codepoints,

    getFont = _material_icons_getfont,
    getSize = _material_icons_getsize
}

end