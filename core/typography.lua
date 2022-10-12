---
-- Get font objects and draw text using material theme
-- @module material.typography

local typography = function(material)
    local __material_font_loader = require(material._UTILS .. ".font_loader")(material)

    -- Loads componentas
    local __material_components_label = require(material._COMPONENTS .. ".label")(material)

    -- Loads default fonts
    local __material_typography_fonts = {
        display = {
            large = __material_font_loader(material.theme.getDisplay("large")),
            medium = __material_font_loader(material.theme.getDisplay("medium")),
            small = __material_font_loader(material.theme.getDisplay("small"))
        },
        headline = {
            large = __material_font_loader(material.theme.getHeadline("large")),
            medium = __material_font_loader(material.theme.getHeadline("medium")),
            small = __material_font_loader(material.theme.getHeadline("small"))
        },
        title = {
            large = __material_font_loader(material.theme.getTitle("large")),
            medium = __material_font_loader(material.theme.getTitle("medium")),
            small = __material_font_loader(material.theme.getTitle("small"))
        },
        label = {
            large = __material_font_loader(material.theme.getLabel("large")),
            medium = __material_font_loader(material.theme.getLabel("medium")),
            small = __material_font_loader(material.theme.getLabel("small"))
        },
        body = {
            large = __material_font_loader(material.theme.getBody("large")),
            medium = __material_font_loader(material.theme.getBody("medium")),
            small = __material_font_loader(material.theme.getBody("small"))
        }
    }

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
    -- @param text The string to draw
    -- @param color_variant A color variant string
    -- @param font_variant "display", "headline", "title", "label" or "body"
    -- @param x The position in x-axis
    -- @param y The position in y-axis
    -- @param font_size "large", "medium" or "small"
    local __material_typography_label = function (text, color_variant, font_variant, x, y, font_size)
        __material_components_label(text, color_variant, font_variant, x, y, font_size)
    end

    return {
        getDisplay = __material_typography_getdisplay,
        getHeadline = __material_typography_getheadline,
        getTitle = __material_typography_gettitle,
        getLabel = __material_typography_getlabel,
        getBody = __material_typography_getbody,
        label = __material_typography_label
    }
end

return typography