---
-- Theme manipulation
-- @module material.theme

return function ( material )

-- Loads color palette
local _material_theme_colorpalette = require (material._CONSTANTS .. ".colorpalette")

-- Sets color theme
local _material_theme_colorprimary          = _material_theme_colorpalette["blue"]["500"]
local _material_theme_colorprimaryvariant   = _material_theme_colorpalette["blue"]["700"]
local _material_theme_coloronprimary        = _material_theme_colorpalette["white"]
local _material_theme_colorsecondary        = _material_theme_colorpalette["teal"]["200"]
local _material_theme_colorsecondaryvariant = _material_theme_colorpalette["teal"]["400"]
local _material_theme_coloronsecondary      = _material_theme_colorpalette["black"]
local _material_theme_colorbackground       = _material_theme_colorpalette["white"]
local _material_theme_coloronbackground     = _material_theme_colorpalette["black"]
local _material_theme_colorsurface          = _material_theme_colorpalette["white"]
local _material_theme_coloronsurface        = _material_theme_colorpalette["black"]
local _material_theme_colorerror            = _material_theme_colorpalette["red"]["900"]
local _material_theme_coloronerror          = _material_theme_colorpalette["white"]
local _material_theme_opacityfocused        = 0.87
local _material_theme_opacityactive         = 0.54
local _material_theme_opacityinactive       = 0.38
local _material_theme_opacityripple         = 0.2

---
-- Sets the primary color
-- @function setPrimary
-- @param color A color table
local function _material_theme_setprimary ( color )
    _material_theme_colorprimary = color
end

---
-- Gets the tonal variation of the primary color
-- @function getPrimary
-- @return The current color
local function _material_theme_getprimary ()
    return { unpack(_material_theme_colorprimary) }
end

---
-- Sets the tonal variation of the primary color
-- @function setPrimaryVariant
-- @param color A color table
local function _material_theme_setprimaryvariant ( color )
    _material_theme_colorprimaryvariant = color
end

---
-- Gets the primary color
-- @function getPrimaryVariant
-- @return The current color
local function _material_theme_getprimaryvariant ()
    return { unpack(_material_theme_colorprimaryvariant) }
end

---
-- Sets the color when drawn on top of the primary color
-- @function setOnPrimary
-- @param color A color table
local function _material_theme_setonprimary ( color )
    _material_theme_coloronprimary = color
end

---
-- Sets the color when drawn on top of the primary color
-- @function getOnPrimary
-- @return The current color
local function _material_theme_getonprimary ()
    return { unpack(_material_theme_coloronprimary) }
end

---
-- Sets the secondary color
-- @param color A color table
local function _material_theme_setsecondary ( color )
    _material_theme_colorsecondary = color
end

---
-- Gets the secondary color
-- @return The current color
local function _material_theme_getsecondary ()
    return { unpack(_material_theme_colorsecondary) }
end

---
-- Sets the tonal variation of the secondary color
-- @param color A color table
local function _material_theme_setsecondaryvariant ( color )
    _material_theme_colorsecondaryvariant = color
end

---
-- Gets the tonal variation of the secondary color
-- @return The current color
local function _material_theme_getsecondaryvariant ()
    return { unpack(_material_theme_colorsecondaryvariant) }
end

---
-- Sets the color when drawn on top of the secondary color
-- @param color A color table
local function _material_theme_setonsecondary ( color )
    _material_theme_coloronsecondary = color
end

---
-- Gets the color when drawn on top of the secondary color
-- @return The current color
local function _material_theme_getonsecondary ()
    return { unpack(_material_theme_coloronsecondary) }
end

---
-- Sets the background color appears behind scrollable content
-- @param color A color table
local function _material_theme_setbackground ( color )
    _material_theme_colorbackground = color
end

---
-- Gets the background color appears behind scrollable content
-- @return The current color
local function _material_theme_getbackground ()
    return { unpack(_material_theme_colorbackground) }
end

---
-- Sets the color when drawn on top of the background color
-- @param color A color table
local function _material_theme_setonbackground ( color )
    _material_theme_coloronbackground = color
end

---
-- Gets the color when drawn on top of the background color
-- @return The current color
local function _material_theme_getonbackground ()
    return { unpack(_material_theme_coloronbackground) }
end

---
-- Sets the surface color
-- @param color A color table
local function _material_theme_setsurface ( color )
    _material_theme_colorsurface = color
end

---
-- Gets the surface color
-- @return The current color
local function _material_theme_getsurface ()
    return { unpack(_material_theme_colorsurface) }
end

---
-- Sets the color when drawn on top of the surface color
-- @param color A color table
local function _material_theme_setonsurface ( color )
    _material_theme_coloronsurface = color
end

---
-- Gets the color when drawn on top of the surface color
-- @return The current color
local function _material_theme_getonsurface ()
    return { unpack(_material_theme_coloronsurface) }
end

---
-- Sets the error color
-- @param color A color table
local function _material_theme_seterror ( color )
    _material_theme_colorerror = color
end

---
-- Gets the error color
-- @return The current color
local function _material_theme_geterror ()
    return { unpack(_material_theme_colorerror) }
end

---
-- Sets the color when drawn on top of the error color
-- @param color A color table
local function _material_theme_setonerror ( color )
    _material_theme_coloronerror = color
end

---
-- Gets the color when drawn on top of the error color
-- @return The current color
local function _material_theme_getonerror ()
    return { unpack(_material_theme_coloronerror) }
end

---
-- Sets the opacity when drawn on focused items
-- @param opacity A opacity value
local function _material_theme_setfocused ( opacity )
    _material_theme_opacityfocused = opacity
end

---
-- Gets the color when drawn on focused items
-- @return The current color
local function _material_theme_getfocused ()
    local color = _material_theme_getonsurface()
    color[4] = (color[4] or 1) * _material_theme_opacityfocused
    return { unpack(color) }
end

---
-- Sets the opacity when drawn on active items
-- @param opacity A opacity value
local function _material_theme_setactive ( opacity )
    _material_theme_opacityactive = opacity
end

---
-- Gets the color when drawn on active items
-- @return The current color
local function _material_theme_getactive ()
    local color = _material_theme_getonsurface()
    color[4] = (color[4] or 1) * _material_theme_opacityactive
    return { unpack(color) }
end

---
-- Sets the opacity when drawn on inactive items
-- @param opacity A opacity value
local function _material_theme_setinactive ( opacity )
    _material_theme_opacityinactive = opacity
end

---
-- Gets the color when drawn on inactive items
-- @return The current color
local function _material_theme_getinactive ()
    local color = _material_theme_getonsurface()
    color[4] = (color[4] or 1) * _material_theme_opacityinactive
    return { unpack(color) }
end

---
-- Sets the opacity of the ripple
-- @param opacity A opacity value
local function _material_theme_setripple ( opacity )
    _material_theme_opacityripple = opacity
end

---
-- Sets the color ripple on primary elements
-- @param color A color table
local function _material_theme_getprimaryripple ( color )
    local color = _material_theme_getonprimary()
    color[4] = (color[4] or 1) * _material_theme_opacityripple
    return { unpack(color) }
end

---
-- Sets the color ripple on secondary elements
-- @param color A color table
local function _material_theme_getsecondaryripple ( color )
    local color = _material_theme_getonsecondary()
    color[4] = (color[4] or 1) * _material_theme_opacityripple
    return { unpack(color) }
end

---
-- Sets the color ripple on surface elements
-- @param color A color table
local function _material_theme_getsurfaceripple ( color )
    local color = _material_theme_getonsurface()
    color[4] = (color[4] or 1) * _material_theme_opacityripple
    return { unpack(color) }
end

return {
    palette = _material_theme_colorpalette,

    setPrimary          = _material_theme_setprimary,
    getPrimary          = _material_theme_getprimary,
    setPrimaryVariant   = _material_theme_setprimaryvariant,
    getPrimaryVariant   = _material_theme_getprimaryvariant,
    setOnPrimary        = _material_theme_setonprimary,
    getOnPrimary        = _material_theme_getonprimary,
    setSecondary        = _material_theme_setsecondary,
    getSecondary        = _material_theme_getsecondary,
    setSecondaryVariant = _material_theme_setsecondaryvariant,
    getSecondaryVariant = _material_theme_getsecondaryvariant,
    setOnSecondary      = _material_theme_setonsecondary,
    getOnSecondary      = _material_theme_getonsecondary,
    setBackground       = _material_theme_setbackground,
    getBackground       = _material_theme_getbackground,
    setOnBackground     = _material_theme_setonbackground,
    getOnBackground     = _material_theme_getonbackground,
    setSurface          = _material_theme_setsurface,
    getSurface          = _material_theme_getsurface,
    setOnSurface        = _material_theme_setonsurface,
    getOnSurface        = _material_theme_getonsurface,
    setError            = _material_theme_seterror,
    getError            = _material_theme_geterror,
    setOnError          = _material_theme_setonerror,
    getOnError          = _material_theme_getonerror,
    setFocused          = _material_theme_setfocused,
    getFocused          = _material_theme_getfocused,
    setActive           = _material_theme_setactive,
    getActive           = _material_theme_getactive,
    setInactive         = _material_theme_setinactive,
    getInactive         = _material_theme_getinactive,
    setRipple           = _material_theme_setripple,
    getPrimaryRipple    = _material_theme_getprimaryripple,
    getSecondaryRipple  = _material_theme_getsecondaryripple,
    getSurfaceRipple    = _material_theme_getsurfaceripple
}

end