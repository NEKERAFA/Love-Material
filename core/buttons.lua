---
-- Draws buttons and icon buttons using material theme
-- @module material.buttons

return function ( material )

local _material_components_button     = require (material._COMPONENTS .. ".button")
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
-- Gets the size of the icon buttons in pixels
-- @function getPixelSize
-- @return The size of the icon buttons in pixel
local function _material_buttons_geticonpixelsize ()
    local _size = 40
    if _material_buttons_size == "small" then
        _size = 32
    end

    return _size
end

-- Gets the size of the buttons in pixels
-- @function getPixelSize
-- @return The size of the buttons in pixel
local function _material_buttons_getpixelsize ()
    local _size = 36
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
    else
        error("size must be 'normal' or 'small'")
    end
end

---
-- Draws a button
-- @function button
-- @param icon The icon to draw
-- @param x The position in x-axis
-- @param y The position in y-axis
-- @param[opt] ripple_x The position of the ripple in the local x-axis
-- @param[opt] ripple_y The position of the ripple in the local y-axis
-- @param[opt] ripple_radius The radius of the ripple
-- @param[opt] variant The type of the icon: "contained", "outlined" or "text"
-- @param[opt] width The width of the icon
-- @param[opt] inactive Shows the icon as disabled
-- @param[opt] hover Shows the icon as hover
-- @param[opt] focused Shows the outlined of the focused button
local function _material_buttons_button ( content, x, y, ripple_x, ripple_y, ripple_radius, variant, width, inactive, hover, focused )
    local callback = _material_components_button(material)
    callback(content, x, y, ripple_x, ripple_y, ripple_radius, variant, width, inactive, hover, focused)
end

---
-- Draws a icon button
-- @function iconbutton
-- @param icon The icon to draw
-- @param x The position in x-axis
-- @param y The position in y-axis
-- @param[opt] ripple_x The position of the ripple in the local x-axis
-- @param[opt] ripple_y The position of the ripple in the local y-axis
-- @param[opt] ripple_radius The radius of the ripple
-- @param[opt] inactive Shows the icon as disabled
-- @param[opt] hover Shows the icon as hover
-- @param[opt] focused Shows the outlined of the focused button
local function _material_buttons_iconbutton ( icon, x, y, ripple_x, ripple_y, ripple_radius, inactive, hover, focused )
    local callback = _material_components_iconbutton(material)
    callback(icon, x, y, ripple_x, ripple_y, ripple_radius, inactive, hover, focused)
end

return {
    getSize      = _material_buttons_getsize,
    getPixelSize = _material_buttons_getpixelsize,
    getSize      = _material_buttons_getsize,
    button       = _material_buttons_button,
    iconButton   = _material_buttons_iconbutton,
}

end