---
-- Draws buttons and icon buttons using material theme
-- @module material.buttons

return function ( material )

local _material_components_iconbutton = require (material._COMPONENTS .. ".iconbutton")

local _material_buttons_size = "normal"

---
-- Gets the size of the buttons
-- @function getSize
-- @return the size of the buttons as label
local function _material_buttons_getsize ()
    return _material_buttons_size
end

---
-- Gets the size of the buttons in pixels
-- @function getPixelSize
-- @return the size of the buttons in pixel
local function _material_buttons_getpixelsize ()
    local _size = 40
    if _material_buttons_size == "small" then
        _size = 32
    end

    return _size
end

---
-- Sets the size of the buttons
-- @function getPixelSize
-- @param size The size of the buttons: "normal" for normal size and "small" for condensed size 
local function _material_buttons_size_setsize ( size )
    if size == "normal" or size == "small" then
        _material_buttons_size = size
    end
end

---
-- Draws a icon button
-- @function iconbutton
-- @param icon The icon to draw
-- @param x The position in x-axis
-- @param y The position in y-axis
-- @param[opt=material.buttons.getPixelSize()] ripple_x The position of the ripple in the local x-axis
-- @param[opt=material.buttons.getPixelSize()] ripple_y The position of the ripple in the local y-axis
-- @param[opt=0] ripple_radius The radius of the ripple
-- @param[opt=false] outlined Show the outlined of the button
-- @param[opt=false] disabled Show the icon as disabled
-- @param[opt=false] hover Show the icon as hover
local function _material_buttons_iconbutton ( icon, x, y, ripple_x, ripple_y, ripple_radius, outlined, disabled, hover )
    local callback = _material_components_iconbutton(material)
    callback(icon, x, y, ripple_x, ripple_y, ripple_radius, outlined, disabled, hover)
end

return {
    getSize      = _material_buttons_getsize,
    getPixelSize = _material_buttons_getpixelsize,
    getSize      = _material_buttons_getsize,
    iconButton   = _material_buttons_iconbutton,
}

end