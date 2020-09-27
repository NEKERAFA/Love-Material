---
-- Draws inputs as text input, checkbox, radio buttons, ... using material theme
-- @module material.inputs

return function ( material )

local _material_components_checkbox = require (material._COMPONENTS .. ".checkbox")
local _material_components_radio    = require (material._COMPONENTS .. ".radio")
local _material_components_switch   = require (material._COMPONENTS .. ".switch")

local _material_inputs_size = "normal"

---
-- Gets the size of the inputs
-- @function getSize
-- @return the size of the input as label
local function _material_inputs_getsize ()
    return _material_inputs_size
end

---
-- Gets the size of the inputs in pixels
-- @function getPixelSize
-- @return The size of the inputs in pixel
local function _material_inputs_getpixelsize ()
    local _size = 40
    if _material_inputs_size == "small" then
        _size = 32
    end

    return _size
end

---
-- Sets the size of the inputs
-- @function setSize
-- @param size The size of the inputs: "normal" for normal size and "small" for condensed size 
local function _material_inputs_setsize ( size )
    if size == "normal" or size == "small" then
        _material_inputs_size = size
    else
        error("size must be 'normal' or 'small'")
    end
end

---
-- Draws a checkbox
-- @function checkbox
-- @param x The position in x-axis
-- @param y The position in y-axis
-- @param[opt] ripple The radius of the ripple
-- @param[opt] checked true if is checked and false otherwise
-- @param[opt] indeterminate true if the checkbox is indeterminate (the checked value is omited)
-- @param[opt] inactive Shows the button as disabled
-- @param[opt] hover Shows the button as hover
-- @param[opt] focused Shows the outlined of the focused button
local function _material_inputs_checkbox ( x, y, ripple, checked, indeterminate, inactive, hover, focused )
    local callback = _material_components_checkbox(material)
    callback(x, y, ripple, checked, indeterminate, inactive, hover, focused)
end

---
-- Draws a radio button
-- @function radio
-- @param x The position in x-axis
-- @param y The position in y-axis
-- @param[opt] ripple The radius of the ripple
-- @param[opt] selected true if is selected and false otherwise
-- @param[opt] inactive Shows the button as disabled
-- @param[opt] hover Shows the button as hover
-- @param[opt] focused Shows the outlined of the focused button
local function _material_inputs_radio ( x, y, ripple, selected, inactive, hover, focused )
    local callback = _material_components_radio(material)
    callback(x, y, ripple, selected, inactive, hover, focused)
end

local function _material_inputs_switch ( x, y, ripple, selected, inactive, hover, focused )
    local callback = _material_components_switch(material)
    callback(x, y, ripple, selected, inactive, hover, focused)
end

return {
    getSize      = _material_inputs_getsize,
    getPixelSize = _material_inputs_getpixelsize,
    setSize      = _material_inputs_setsize,
    checkbox     = _material_inputs_checkbox,
    radio        = _material_inputs_radio,
    switch       = _material_inputs_switch
}

end