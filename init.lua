local _material = {
    VERSION      = 'Mäterial 1.0.0',
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

local BASE = ...

-- Create color module
_material.colors = {}

-- Loads palette
local _material_colors_palette = require (BASE .. ".constants.colors")
_material.colors.palette = _material_colors_palette

-- Create icon module
_material.icons = {}

-- Loads codepoints
local _material_icons_codepoints = require (BASE .. ".constants.icons")
_material.icons.codepoints = _material_icons_codepoints

-- Create button module
_material.buttons = {}

-- Loads icon button draw function
local _material_buttons_iconbutton = require (BASE .. ".components.iconbutton")
_material.buttons.iconbutton = _material_buttons_iconbutton

-- Loads utils module
_material.utils = require (BASE .. ".utils")

-- Create extension module
_material.ext = {}

-- Loads icon button object
local _material_ext_newiconbutton = require (BASE .. ".extensions.iconbutton")
_material.ext.newIconButton = _material_ext_newiconbutton

return _material