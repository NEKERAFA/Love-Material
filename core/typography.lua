---
-- Get font objects and draw text using material theme
-- @module material.typography

local __material_typography = function(material)
    local __material_font_loader = require(material._UTILS .. ".font_loader")(material)

    -- Loads componentas
    local __material_components_label = require(material._COMPONENTS .. ".label")(material)

    local __material_typography_fonts = nil

    -- Loads default fonts
    local __material_typography_loadfontsfromscheme = function (scheme)
        __material_typography_fonts = {
            display = {
                large = __material_font_loader(scheme["display"]["large"]),
                medium = __material_font_loader(scheme["display"]["medium"]),
                small = __material_font_loader(scheme["display"]["small"])
            },
            headline = {
                large = __material_font_loader(scheme["headline"]["large"]),
                medium = __material_font_loader(scheme["headline"]["medium"]),
                small = __material_font_loader(scheme["headline"]["small"])
            },
            title = {
                large = __material_font_loader(scheme["title"]["large"]),
                medium = __material_font_loader(scheme["title"]["medium"]),
                small = __material_font_loader(scheme["title"]["small"])
            },
            label = {
                large = __material_font_loader(scheme["label"]["large"]),
                medium = __material_font_loader(scheme["label"]["medium"]),
                small = __material_font_loader(scheme["label"]["small"])
            },
            body = {
                large = __material_font_loader(scheme["body"]["large"]),
                medium = __material_font_loader(scheme["body"]["medium"]),
                small = __material_font_loader(scheme["body"]["small"])
            }
        }
    end

    -- Loads default font
    __material_typography_loadfontsfromscheme(material.theme.getFontSchemes())

    ---
    -- Gets the display font
    -- @function getDisplay
    -- @param size "large", "medium" or "small"
    local __material_typography_getdisplay = function(size)
        return __material_typography_fonts.display[size]
    end

    ---
    -- Gets the headline font
    -- @function getHeadline
    -- @param size "large", "medium" or "small"
    local __material_typography_getheadline = function(size)
        return __material_typography_fonts.headline[size]
    end

    ---
    -- Gets the title font
    -- @function getTitle
    -- @param size "large", "medium" or "small"
    local __material_typography_gettitle = function(size)
        return __material_typography_fonts.title[size]
    end

    ---
    -- Gets the label font
    -- @function getLabel
    -- @param size "large", "medium" or "small"
    local __material_typography_getlabel = function(size)
        return __material_typography_fonts.label[size]
    end

    ---
    -- Gets the body font
    -- @function getBody
    -- @param size "large", "medium" or "small"
    local __material_typography_getbody = function(size)
        return __material_typography_fonts.body[size]
    end

    ---
    -- Draws a label using material theme
    -- @function label
    -- @param content A string with the text or a table with the following values:
    -- <ul style="list-style-type: circle">
    -- <li><span class='parameter'>icon</span> The icon of the button
    -- <li><span class='parameter'>text</span> The text of the button
    -- </ul>
    -- @param font_variant "display", "headline", "title", "label" or "body"
    -- @param x The position in x-axis
    -- @param y The position in y-axis
    -- @param font_size "large", "medium" or "small"
    local __material_typography_label = function (content, font_variant, x, y, font_size)
        __material_components_label(content, font_variant, x, y, font_size)
    end

    return {
        loadFontsFromScheme = __material_typography_loadfontsfromscheme,
        getDisplay = __material_typography_getdisplay,
        getHeadline = __material_typography_getheadline,
        getTitle = __material_typography_gettitle,
        getLabel = __material_typography_getlabel,
        getBody = __material_typography_getbody,
        label = __material_typography_label
    }
end

return __material_typography