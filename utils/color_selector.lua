local color_selector = function(material)
    ---
    -- Gets a color from material theme
    -- @function select
    -- @param variant a variant color
    local __color_selector_select = function(variant)
        if variant == "primary" then
            return material.theme.getPrimary()
        elseif variant == "primarycontainer" then
            return material.theme.getPrimaryContainer()
        elseif variant == "onprimary" then
            return material.theme.getOnPrimary()
        elseif variant == "onprimarycontainer" then
            return material.theme.getOnPrimaryContainer()
        elseif variant == "inverseprimary" then
            return material.theme.getInversePrimary()
        elseif variant == "secondary" then
            return material.theme.getSecondary()
        elseif variant == "secondarycontainer" then
            return material.theme.getSecondaryContainer()
        elseif variant == "onsecondary" then
            return material.theme.getOnSecondary()
        elseif variant == "onsecondarycontainer" then
            return material.theme.getOnSecondaryContainer()
        elseif variant == "tertiary" then
            return material.theme.getTertiary()
        elseif variant == "tertiarycontainer" then
            return material.theme.getTertiaryContainer()
        elseif variant == "ontertiary" then
            return material.theme.getOnTertiary()
        elseif variant == "ontertiarycontainer" then
            return material.theme.getOnTertiaryContainer()
        elseif variant == "surface" then
            return material.theme.getSurface()
        elseif variant == "surfacetint" then
            return material.theme.getSurfaceTint()
        elseif variant == "surfacevariant" then
            return material.theme.getSurfaceVariant()
        elseif variant == "inversesurface" then
            return material.theme.getInverseSurface()
        elseif variant == "onsurface" then
            return material.theme.getOnSurface()
        elseif variant == "onsurfacevariant" then
            return material.theme.getOnSurfaceVariant()
        elseif variant == "oninversesurface" then
            return material.theme.getOnInverseSurface()
        elseif variant == "background" then
            return material.theme.getBackground()
        elseif variant == "onbackground" then
            return material.theme.getOnBackground()
        elseif variant == "error" then
            return material.theme.getError()
        elseif variant == "errorcontainer" then
            return material.theme.getErrorContainer()
        elseif variant == "onerror" then
            return material.theme.getOnError()
        elseif variant == "onerrorcontainer" then
            return material.theme.getOnErrorContainer()
        elseif variant == "outline" then
            return material.theme.getOutline()
        end

        return nil
    end

    return __color_selector_select
end

return color_selector