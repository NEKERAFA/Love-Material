local __material_components_label = function(material)
    local __color_selector = require(material._UTILS .. ".color_selector")(material)
    local __font_selector = require(material._UTILS .. ".font_selector")(material)

    local __material_typography_label = function(content, font, x, y, size)
        -- Checks color
        local _text, _color
        if type(content) == "table" and #content == 2 then
            _color = __color_selector(tostring(content[1]))
            _text = tostring(content[2])
        else
            _color = __color_selector("onbackground")
            _text = tostring(content)
        end

        -- Checks font
        local _font = __font_selector(tostring(font), (size and tostring(size)) or "small")

        -- Draws text
        love.graphics.print({ _color, _text }, _font, x, y)
    end

    return __material_typography_label
end

return __material_components_label