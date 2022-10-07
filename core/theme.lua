---
-- Theme manipulation
-- @module material.theme

local theme = function(material)
    local __material_theme_light = true

    -- Load color palette (legacy purpose)
    local __material_theme_palette = require(material._CONSTANTS .. ".colors")

    -- Set color theme variables
    local __material_theme_default_colors = require(material._ASSETS_THEME .. ".schemes")
    local __material_theme_colors = nil

    ---
    -- Load a theme schemes
    -- @function loadSchemes
    -- @param path string with the path of theme schemes
    local __material_theme_loadschemes = function(path)
        __material_theme_colors = assert(loadfile(path))()
    end

    ---
    -- Set the default scheme
    -- @function setDefaultScheme
    local __material_theme_setdefaultschemes = function()
        __material_theme_colors = nil
    end

    ---
    -- Gets the current color schemes
    -- @function getSchemes
    -- @param light whether get the light or dark schemes
    local __material_theme_getschemes = function(light)
        return (__material_theme_colors or __material_theme_default_colors)[light and 'light' or 'dark']
    end

    ---
    -- Select the default theme as light
    -- @function setLight
    local __material_theme_setlight = function ()
        __material_theme_light = true
    end

    ---
    -- Select the default theme as dark
    -- @function setDark
    local __material_theme_setdark = function ()
        __material_theme_light = false
    end

    ---
    -- Get the primary color
    -- @function getPrimary
    local __material_theme_getprimary = function ()
        return { unpack(__material_theme_getschemes(__material_theme_light).primary) }
    end

    ---
    -- Get the primary container color
    -- @function getPrimaryContainer
    local __material_theme_getprimarycontainer = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).primary_container) }
    end

    ---
    -- Get the color when drawn on top of the primary color
    -- @function getOnPrimary
    local __material_theme_getonprimary = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).on_primary) }
    end

    ---
    -- Get the color when drawn on top of the primary container color
    -- @function getOnPrimaryContainer
    local __material_theme_getonprimarycontainer = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).on_primary_container) }
    end

    ---
    -- Get the inverse primary color
    -- @function getPrimary
    local __material_theme_getinverseprimary = function ()
        return { unpack(__material_theme_getschemes(__material_theme_light).inverse_primary) }
    end

    ---
    -- Get the secondary color
    -- @function getSecondary
    local __material_theme_getsecondary = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).secondary) }
    end

    ---
    -- Get the secondary container color
    -- @function getSecondaryContainer
    local __material_theme_getsecondarycontainer = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).secondary_container) }
    end

    ---
    -- Get the color when drawn on top of the secondary color
    -- @function getOnSecondary
    local __material_theme_getonsecondary = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).on_secondary) }
    end

    ---
    -- Get the color when drawn on top of the secondary container color
    -- @function getSecondary
    local __material_theme_getonsecondarycontainer = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).on_secondary_container) }
    end

    ---
    -- Get the tertiary color
    -- @function getTertiary
    local __material_theme_gettertiary = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).tertiary) }
    end

    ---
    -- Get the tertiary container color
    -- @function getTertiaryContainer
    local __material_theme_gettertiarycontainer = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).tertiary_container) }
    end

    ---
    -- Get the color when drawn on top of the tertiary color
    -- @function getOnTertiary
    local __material_theme_getontertiary = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).on_tertiary) }
    end

    ---
    -- Get the color when drawn on top of the tertiary container color
    -- @function getTertiary
    local __material_theme_getontertiarycontainer = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).on_tertiary_container) }
    end

    ---
    -- Get the surface color
    -- @function getSurface
    local __material_theme_getsurface = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).surface) }
    end

    ---
    -- Get the surface tint color
    -- @function getSurfaceTint
    local __material_theme_getsurfacetint = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).surface_tint) }
    end

    ---
    -- Get the surface variant color
    -- @function getSurfaceVariant
    local __material_theme_getsurfacevariant = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).surface_variant) }
    end

    ---
    -- Get the inverse surface color
    -- @function getInverseSurface
    local __material_theme_getinversesurface = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).inverse_surface) }
    end

    ---
    -- Get the color when drawn on top of the surface color
    -- @function getOnSurface
    local __material_theme_getonsurface = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).on_surface) }
    end

    ---
    -- Get the color when drawn on top of the surface variant color
    -- @function getOnSurfaceVariant
    local __material_theme_getonsurfacevariant = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).on_surface_variant) }
    end

    ---
    -- Get the color when drawn on top of the inverse surface color
    -- @function getOnInverseSurface
    local __material_theme_getoninversesurface = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).on_inverse_surface) }
    end

    ---
    -- Get the background color
    -- @function getBackground
    local __material_theme_getbackground = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).background) }
    end

    ---
    -- Get the color when drawn on top of the the background color
    -- @function getOnBackground
    local __material_theme_getonbackground = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).on_background) }
    end

    ---
    -- Get the error color
    -- @function getError
    local __material_theme_geterror = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).error) }
    end

    ---
    -- Get the error container color
    -- @function getErrorContainer
    local __material_theme_geterrorcontainer = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).error_container) }
    end

    ---
    -- Get the color when drawn on top of the error color
    -- @function getOnError
    local __material_theme_getonerror = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).on_error) }
    end

    ---
    -- Get the color when drawn on top of the error container color
    -- @function getOnErrorContainer
    local __material_theme_getonerrorcontainer = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).on_error_container) }
    end

    ---
    -- Get the outline color
    -- @function getOutline
    local __material_theme_getoutline = function()
        return { unpack(__material_theme_getschemes(__material_theme_light).outline) }
    end

    return {
        palette = __material_theme_palette,
        colors = __material_theme_colors,

        loadSchemes = __material_theme_loadschemes,
        setDefaultSchemes = __material_theme_setdefaultschemes,
        getSchemes = __material_theme_getschemes,
        setLight = __material_theme_setlight,
        setDark = __material_theme_setdark,
        getPrimary = __material_theme_getprimary,
        getPrimaryContainer = __material_theme_getprimarycontainer,
        getOnPrimary = __material_theme_getonprimary,
        getOnPrimaryContainer = __material_theme_getonprimarycontainer,
        getInversePrimary = __material_theme_getinverseprimary,
        getSecondary = __material_theme_getsecondary,
        getSecondaryContainer = __material_theme_getsecondarycontainer,
        getOnSecondary = __material_theme_getonsecondary,
        getOnSecondaryContainer = __material_theme_getonsecondarycontainer,
        getTertiary = __material_theme_gettertiary,
        getTertiaryContainer = __material_theme_gettertiarycontainer,
        getOnTertiary = __material_theme_getontertiary,
        getOnTertiaryContainer = __material_theme_getontertiarycontainer,
        getSurface = __material_theme_getsurface,
        getSurfaceTint = __material_theme_getsurfacetint,
        getSurfaceVariant = __material_theme_getsurfacevariant,
        getInverseSurface = __material_theme_getinversesurface,
        getOnSurface = __material_theme_getonsurface,
        getOnSurfaceVariant = __material_theme_getonsurfacevariant,
        getOnInverseSurface = __material_theme_getoninversesurface,
        getBackground = __material_theme_getbackground,
        getOnBackground = __material_theme_getonbackground,
        getError = __material_theme_geterror,
        getErrorContainer = __material_theme_geterrorcontainer,
        getOnError = __material_theme_getonerror,
        getOnErrorContainer = __material_theme_getonerrorcontainer,
        getOutline = __material_theme_getoutline
    }
end

return theme