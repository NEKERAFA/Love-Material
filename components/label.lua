local label = function(material)
    local __color_selector = require(material._UTILS .. ".color_selector")(material)
    local __font_selector = require(material._UTILS .. ".font_selector")(material)

    local __material_typography_label = function(text, color_variant, font_variant, x, y, font_size)
        local color = __color_selector(color_variant)
        local font = __font_selector(font_variant, font_size)

        love.graphics.print({ color, text }, font, x, y)
    end

    return __material_typography_label
end

return label