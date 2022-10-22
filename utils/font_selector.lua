local font_selector = function(material)
    ---
    -- Gets a font from material theme
    -- @param variant a variant font
    local __font_selector_select = function(variant, size)
        if variant == "display" then
            return material.typography.getDisplay(size)
        elseif variant == "headline" then
            return material.typography.getHeadline(size)
        elseif variant == "title" then
            return material.typography.getTitle(size)
        elseif variant == "label" then
            return material.typography.getLabel(size)
        elseif variant == "body" then
            return material.typography.getBody(size)
        end
    end

    return __font_selector_select
end

return font_selector