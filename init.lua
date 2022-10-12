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

-- Gets the utils require path
_material._UTILS = _material._BASE .. ".utils"

-- Gets the assets directory
_material._ASSETS = string.gsub(_material._BASE, "%.", "/") .. "/assets"

-- Gets the assets default theme require path
_material._ASSETS_THEME = _material._BASE .. ".assets.theme"

---
-- Loads a component or some components into material library
-- @function loadComponents
-- @param modname The name of the component
_material.loadComponents = function (modname)
    local name = string.match(modname, "%.?(%w+)$")
    local _components = require (modname)
    _material[name] = _components(_material)
end

-- Loads theme module
_material.loadComponents(_material._CORE .. ".theme")

-- Loads typography module
_material.loadComponents(_material._CORE .. ".typography")

return _material