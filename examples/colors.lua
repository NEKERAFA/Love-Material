local material = require "material"

local font_variant = "body"

function love.load()
    love.graphics.setBackgroundColor(material.theme.getBackground())
end

function love.draw()
    material.typography.label({"onbackground", "Hello world from Matërial"}, font_variant, 10, 10, "medium")

    love.graphics.setColor(material.theme.getPrimary())
    love.graphics.rectangle("fill", 20, 100, 100, 50, 5, 5)
    love.graphics.setColor(1, 1, 1)
    material.typography.label({"onprimary", "Primary color"}, font_variant, 30, 110, "small")

    love.graphics.setColor(material.theme.getPrimaryContainer())
    love.graphics.rectangle("fill", 130, 100, 100, 50, 5, 5)
    love.graphics.setColor(1, 1, 1)
    material.typography.label({"onprimarycontainer", "Primary color"}, font_variant, 140, 110, "small")

    love.graphics.setColor(material.theme.getInversePrimary())
    love.graphics.rectangle("line", 240, 100, 100, 50, 5, 5)
    love.graphics.setColor(1, 1, 1)
    material.typography.label({"inverseprimary", "Primary color"}, font_variant, 250, 110, "small")

    love.graphics.setColor(material.theme.getSecondary())
    love.graphics.rectangle("fill", 20, 170, 100, 50, 5, 5)
    love.graphics.setColor(1, 1, 1)
    material.typography.label({"onsecondary", "Secondary color"}, font_variant, 30, 180, "small")

    love.graphics.setColor(material.theme.getSecondaryContainer())
    love.graphics.rectangle("fill", 130, 170, 100, 50, 5, 5)
    love.graphics.setColor(1, 1, 1)
    material.typography.label({"onsecondarycontainer", "Secondary color"}, font_variant, 140, 180, "small")

    love.graphics.setColor(material.theme.getTertiary())
    love.graphics.rectangle("fill", 20, 240, 100, 50, 5, 5)
    love.graphics.setColor(1, 1, 1)
    material.typography.label({"ontertiary", "Tertiary color"}, font_variant, 30, 250, "small")

    love.graphics.setColor(material.theme.getTertiaryContainer())
    love.graphics.rectangle("fill", 130, 240, 100, 50, 5, 5)
    love.graphics.setColor(1, 1, 1)
    material.typography.label({"ontertiarycontainer", "Tertiary color"}, font_variant, 140, 250, "small")
end