---
-- Draws buttons and icon buttons using material theme
-- @module material.buttons

return function ( material )

local _material_components_button     = require (material._COMPONENTS .. ".button")
local _material_components_iconbutton = require (material._COMPONENTS .. ".iconbutton")
local _material_components_fab        = require (material._COMPONENTS .. ".fab")

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
-- @function getIconButtonPixelSize
-- @return The size of the icon buttons in pixel
local function _material_buttons_geticonbuttonpixelsize ()
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
-- Gets the size of the buttons in pixels
-- @function getPixelSize
-- @return The size of the buttons in pixel
local function _material_buttons_getfabpixelsize()
    local _size = 48
    if _material_buttons_size == "small" then
        _size = 40
    end

    return _size
end

---
-- Sets the size of the buttons
-- @function setSize
-- @param size The size of the buttons: "normal" for normal size and "small" for condensed size 
local function _material_buttons_setsize ( size )
    if size == "normal" or size == "small" then
        _material_buttons_size = size
    else
        error("size must be 'normal' or 'small'")
    end
end

---
-- Draws a button
-- @function button
-- @param content A string with the text or a table with the following values:
-- <ul style="list-style-type: circle">
-- <li><span class='parameter'>icon</span> The icon of the button
-- <li><span class='parameter'>text</span> The text of the button
-- </ul>
-- @param x The position in x-axis
-- @param y The position in y-axis
-- @param[opt] ripple A table with the following values: 
-- <ul style="list-style-type: circle">
-- <li><span class='parameter'>x</span> x ripple position in the local x-axis</li>
-- <li><span class='parameter'>y</span> y ripple position in the local y-axis</li>
-- <li><span class='parameter'>radius</span> radius of the ripple</li>
-- </ul>
-- @param[opt] variant The type of the button: "contained", "outlined" or "text"
-- @param[opt] width The width of the button
-- @param[opt] elevation The elevation of the button
-- @param[opt] inactive Shows the button as disabled
-- @param[opt] hover Shows the button as hover
-- @param[opt] focused Shows the outlined of the focused button
local function _material_buttons_button ( content, x, y, ripple, variant, width, elevation, inactive, hover, focused )
    local callback = _material_components_button(material)
    callback(content, x, y, ripple, variant, width, elevation, inactive, hover, focused)
end

---
-- Draws a icon button
-- @function iconButton
-- @param icon The icon to draw
-- @param x The position in x-axis
-- @param y The position in y-axis
-- @param[opt] ripple A table with the following values: 
-- <ul style="list-style-type: circle">
-- <li><span class='parameter'>x</span> x ripple position in the local x-axis</li>
-- <li><span class='parameter'>y</span> y ripple position in the local y-axis</li>
-- <li><span class='parameter'>radius</span> radius of the ripple</li>
-- </ul>
-- @param[opt] variant The type of the button: "contained", "outlined" or "text"
-- @param[opt] width The width of the button
-- @param[opt] elevation The elevation of the button
-- @param[opt] inactive Shows the button as disabled
-- @param[opt] hover Shows the button as hover
-- @param[opt] focused Shows the outlined of the focused button
local function _material_buttons_iconbutton ( icon, x, y, ripple, elevation, inactive, hover, focused )
    local callback = _material_components_iconbutton(material)
    callback(icon, x, y, ripple, elevation, inactive, hover, focused)
end

---
-- Draws a foating action button
-- @function foatingActionButton
-- @param content A string with the text or a table with the following values:
-- <ul style="list-style-type: circle">
-- <li><span class='parameter'>icon</span> The icon of the button
-- <li><span class='parameter'>text</span> The text of the button
-- </ul>
-- @param x The position in x-axis
-- @param y The position in y-axis
-- @param[opt] ripple A table with the following values: 
-- <ul style="list-style-type: circle">
-- <li><span class='parameter'>x</span> x ripple position in the local x-axis</li>
-- <li><span class='parameter'>y</span> y ripple position in the local y-axis</li>
-- <li><span class='parameter'>radius</span> radius of the ripple</li>
-- </ul>
-- @param[opt] variant The type of the button: "contained", "outlined" or "text"
-- @param[opt] width The width of the button
-- @param[opt] elevation The elevation of the button
-- @param[opt] inactive Shows the button as disabled
-- @param[opt] hover Shows the button as hover
-- @param[opt] focused Shows the outlined of the focused button
local function _material_buttons_fab ( content, x, y, ripple, elevation, inactive, hover, focused )
    local callback = _material_components_fab(material)
    callback(content, x, y, ripple, elevation, inactive, hover, focused)
end

return {
    getSize              = _material_buttons_getsize,
    getPixelSize         = _material_buttons_getpixelsize,
    getIconPixelSize     = _material_buttons_geticonbuttonpixelsize,
    getFabPixelSize      = _material_buttons_getfabpixelsize,
    setSize              = _material_buttons_setsize,
    button               = _material_buttons_button,
    iconButton           = _material_buttons_iconbutton,
    floatingActionButton = _material_buttons_fab,
}

end