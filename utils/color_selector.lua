local color_selector = function(material)
    ---
    -- Gets a color from material theme
    -- @function select
    -- @param variant a variant color
    local __color_selector_select = function(variant)
        if variant == "primary" then
            return material.theme.getPrimary()
        elseif variant == "primary_container" then
            return material.theme.getPrimaryContainer()
        elseif variant == "on_primary" then
            return material.theme.getOnPrimary()
        elseif variant == "on_primary_container" then
            return material.theme.getOnPrimaryContainer()
        elseif variant == "inverse_primary" then
            return material.theme.getInversePrimary()
        elseif variant == "secondary" then
            return material.theme.getSecondary()
        elseif variant == "secondary_container" then
            return material.theme.getSecondaryContainer()
        elseif variant == "on_secondary" then
            return material.theme.getOnSecondary()
        elseif variant == "on_secondary_container" then
            return material.theme.getOnSecondaryContainer()
        elseif variant == "tertiary" then
            return material.theme.getTertiary()
        elseif variant == "tertiary_container" then
            return material.theme.getTertiaryContainer()
        elseif variant == "on_tertiary" then
            return material.theme.getOnTertiary()
        elseif variant == "on_tertiary_container" then
            return material.theme.getOnTertiaryContainer()
        elseif variant == "surface" then
            return material.theme.getSurface()
        elseif variant == "surface_tint" then
            return material.theme.getSurfaceTint()
        elseif variant == "surface_variant" then
            return material.theme.getSurfaceVariant()
        elseif variant == "inverse_surface" then
            return material.theme.getInverseSurface()
        elseif variant == "on_surface" then
            return material.theme.getOnSurface()
        elseif variant == "on_surface_variant" then
            return material.theme.getOnSurfaceVariant()
        elseif variant == "on_inverse_surface" then
            return material.theme.getOnInverseSurface()
        elseif variant == "background" then
            return material.theme.getBackground()
        elseif variant == "on_background" then
            return material.theme.getOnBackground()
        elseif variant == "error" then
            return material.theme.getError()
        elseif variant == "error_container" then
            return material.theme.getErrorContainer()
        elseif variant == "on_error" then
            return material.theme.getOnError()
        elseif variant == "on_error_container" then
            return material.theme.getOnErrorContainer()
        elseif variant == "outline" then
            return material.theme.getOutline()
        end

        return nil
    end

    return __color_selector_select
end

return color_selector