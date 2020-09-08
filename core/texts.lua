---
-- Draws text using material theme
-- @module material.texts

return function ( material )

-- Loads emoji codepoint
local _material_texts_emojis = require (material._CONSTANTS .. ".emojis")

-- Loads all fonts
local _material_texts_fontdisplay1 = love.graphics.newFont(material._ASSETS .. "/fonts/NotoSansDisplay-Regular.ttf", 32)
local _material_texts_fontdisplay2 = love.graphics.newFont(material._ASSETS .. "/fonts/NotoSansDisplay-Regular.ttf", 24)
local _material_texts_fontdisplay3 = love.graphics.newFont(material._ASSETS .. "/fonts/NotoSansDisplay-Regular.ttf", 20)
local _material_texts_fontdisplay4 = love.graphics.newFont(material._ASSETS .. "/fonts/NotoSansDisplay-Regular.ttf", 18)
local _material_texts_fontdisplay5 = love.graphics.newFont(material._ASSETS .. "/fonts/NotoSansDisplay-Regular.ttf", 16)
local _material_texts_fontdisplay6 = love.graphics.newFont(material._ASSETS .. "/fonts/NotoSansDisplay-Regular.ttf", 14)
local _material_texts_fontsubtitle = love.graphics.newFont(material._ASSETS .. "/fonts/NotoSansDisplay-Regular.ttf", 12)
local _material_texts_fontsans     = love.graphics.newFont(material._ASSETS .. "/fonts/NotoSans-Regular.ttf", 12)
local _material_texts_fontserif    = love.graphics.newFont(material._ASSETS .. "/fonts/NotoSerif-Regular.ttf", 12)
local _material_texts_fontmono     = love.graphics.newFont(material._ASSETS .. "/fonts/NotoMono-Regular.ttf", 12)
local _material_texts_fontemoji    = love.graphics.newFont(material._ASSETS .. "/fonts/NotoColorEmoji.ttf", 12)

---
-- Gets the header font
-- @function getDisplay
-- @param header The header size (1-6)
-- @return The font
local function _material_text_getdisplay (header)
    if header == 1 then
        return _material_texts_fontdisplay1
    elseif header == 2 then
        return _material_texts_fontdisplay2
    elseif header == 3 then
        return _material_texts_fontdisplay3
    elseif header == 4 then
        return _material_texts_fontdisplay4
    elseif header == 5 then
        return _material_texts_fontdisplay5
    elseif header == 6 then
        return _material_texts_fontdisplay6
    end

    error("header must be between 1 and 6")
end

---
-- Gets the sub header font
-- @function getSubtitle
-- @return The font
local function _material_text_getsubtitle ()
    return _material_texts_fontsubtitle
end

---
-- Gets the body font
-- @function getBody
-- @param family The family font: sans, serif or mono
-- @return The font
local function _material_text_getbody (family)
    if family == "sans" then
        return _material_texts_fontsans
    elseif family == "serif" then
        return _material_texts_fontserif
    elseif family == "mono" then
        return _material_texts_fontmono
    end
end

---
-- Gets the emoji font
-- @function getEmoji
-- @return The font
local function _material_text_getemoji ()
    return _material_texts_fontemoji
end

return {
   getDisplay  = _material_text_getdisplay,
   getSubtitle = _material_text_getsubtitle,
   getBody     = _material_text_getbody,
   getEmoji    = _material_texts_emojis 
}

end