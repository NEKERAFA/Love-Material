---
-- Mäterial labs extension
-- @module material.ext

return function ( material )

local _material_ext_iconbutton = require (material.getBase() .. ".extensions.iconbutton")

---
-- Creates a new icon button
-- @param icon The icon to draw
-- @param options A table that represents the aditional options
-- @return A icon button object
local function _material_ext_newiconbutton = function ( icon, options )
    local callback = _material_ext_newiconbutton(material)
    return callback(icon, options)
end

return {
    newIconButton = _material_ext_newiconbutton
}

end