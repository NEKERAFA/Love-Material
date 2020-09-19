---
-- Icon manipulation
-- @module material.icons

return function ( material )

-- Loads icon codepoint
local _material_icons_codepoints = require (material._CONSTANTS .. ".icons")

-- Sets icon size
local _material_icons_size = 20
local _material_icons_buttonsize = 18

-- Loads icon font
local _material_icons_font = love.graphics.newFont(material._ASSETS .. "/fonts/MaterialIcons-Regular.ttf", _material_icons_size)
local _material_icons_buttonfont = love.graphics.newFont(material._ASSETS .. "/fonts/MaterialIcons-Regular.ttf", _material_icons_buttonsize)

---
-- Gets the icon font
-- @function getFont
-- @return The icon font
local function _material_icons_getfont ()
    return _material_icons_font
end

---
-- Gets the icon font for print in buttons
-- @function getButtonFont
-- @return The icon font
local function _material_icons_getbuttonfont ()
    return _material_icons_buttonfont
end

---
-- Gets the size in pixels of the icons
-- @function getSize
-- @return The size in pixels
local function _material_icons_getsize ()
    return _material_icons_size
end

---
-- Gets the size in pixels of the icons when drawn on button
-- @function getButtonSize
-- @return The size in pixels
local function _material_icons_getbuttonsize ()
    return _material_icons_buttonsize
end

return {
    codepoints = _material_icons_codepoints,

    getFont       = _material_icons_getfont,
    getButtonFont = _material_icons_getbuttonfont,
    getSize       = _material_icons_getsize,
    getButtonSize = _material_icons_getbuttonsize
}

end