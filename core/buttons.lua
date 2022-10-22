---
-- Draws buttons using material theme
-- @module material.buttons

local __material_buttons = function(material)
    local __material_components_button = require (material._COMPONENTS .. ".button")(material)

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
    -- @param[opt] variant The state of the button: "elevated", "filled", "filledtonal", "outline", "text"
    -- @param[opt] state The state of the button: "enabled", "disabled", "hovered", "focused", "pressed"
    -- @param[opt] width The width of the button
    local __material_buttons_button = function(content, x, y, variant, state, width)
        __material_components_button(content, x, y, variant, state, width)
    end

    return {
        button = __material_buttons_button,
    }
end

return __material_buttons