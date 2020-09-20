---
-- Basic functions and components
-- @module material

local _material = {
    _VERSION      = 'Mäterial 1.0.0',
    _DESCRIPTION = 'Immediate Mode UI library for LÖVE that implements the Material Design specs.',
    _URL         = 'https://github.com/NEKERAFA/Love-Material',
    _LICENSE     = [[
        Material Design Icon font is under Apache 2.0 License.
        
        See more: https://github.com/google/material-design-icons/blob/master/LICENSE

        -------------------------------------------------------------------------------

        Roboto font is under Apache 2.0 License.
        
        See more: https://github.com/googlefonts/roboto/blob/master/LICENSE

        -------------------------------------------------------------------------------

        Open Sans font is under Apache 2.0 License.
        
        See more: https://github.com/googlefonts/opensans/blob/master/LICENSE.txt
        
        -------------------------------------------------------------------------------

        Mäterial is under MIT License

        Copyright (c) 2020 Rafael Alcalde Azpiazu (NEKERAFA)

        Permission is hereby granted, free of charge, to any person obtaining a copy
        of this software and associated documentation files (the "Software"), to deal
        in the Software without restriction, including without limitation the rights
        to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
        copies of the Software, and to permit persons to whom the Software is
        furnished to do so, subject to the following conditions:

        The above copyright notice and this permission notice shall be included in all
        copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
        IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
        FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
        AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
        LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
        OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
        SOFTWARE.
    ]]
}

-- Gets the material require path
_material._BASE = ...

-- Gets the core require path
_material._CORE = _material._BASE .. ".core"

-- Gets the constants require path
_material._CONSTANTS = _material._BASE .. ".constants"

-- Gets the components require path
_material._COMPONENTS = _material._BASE .. ".components"

-- Gets the extension require path
_material._EXTENSIONS = _material._BASE .. ".extensions"

-- Gets the assets directory
_material._ASSETS = string.gsub(_material._BASE, "%.", "/") .. "/assets"

---
-- Loads a component or some components into material library
-- @function require
-- @param modname The name of the component
_material.loadComponents = function (modname)
    local name = string.match(modname, "%.?(%w+)$")
    local _components = require (modname)
    _material[name] = _components(_material)
end

-- Loads theme module
_material.loadComponents(_material._CORE .. ".theme")

-- Loads icon module
_material.loadComponents(_material._CORE .. ".icons")

-- Loads texts module
_material.loadComponents(_material._CORE .. ".texts")

-- Loads buttons module
_material.loadComponents(_material._CORE .. ".buttons")

-- Load shadow module
local _material_shadow = require (_material._CORE .. ".shadow")

---
-- Creates a texture with a blur effect
-- @function shadow
-- @param width The width of the texture
-- @param height The height of the texture
-- @param radius The radius of blur in pixels
-- @param onDraw The function that draws the graphics resources to blur
_material.shadow = function (width, height, radius, onDraw)
    local callback = _material_shadow(_material)
    return callback(width, height, radius, onDraw)
end

return _material