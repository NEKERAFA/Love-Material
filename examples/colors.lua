local material = require "material"

function love.load()
    love.graphics.setBackgroundColor(material.theme.getBackground())
end

function love.draw()
    love.graphics.setColor(material.theme.getOnBackground())
    love.graphics.print("Hello world", 10, 10)

    love.graphics.setColor(material.theme.getPrimary())
    love.graphics.rectangle("fill", 20, 100, 100, 50, 5, 5)
    love.graphics.setColor(material.theme.getOnPrimary())
    love.graphics.print("Primary color", 30, 110)

    love.graphics.setColor(material.theme.getPrimaryContainer())
    love.graphics.rectangle("fill", 130, 100, 100, 50, 5, 5)
    love.graphics.setColor(material.theme.getOnPrimaryContainer())
    love.graphics.print("Primary color", 140, 110)

    love.graphics.setColor(material.theme.getInversePrimary())
    love.graphics.rectangle("line", 240, 100, 100, 50, 5, 5)
    love.graphics.setColor(material.theme.getInversePrimary())
    love.graphics.print("Primary color", 250, 110)

    love.graphics.setColor(material.theme.getSecondary())
    love.graphics.rectangle("fill", 20, 170, 100, 50, 5, 5)
    love.graphics.setColor(material.theme.getOnSecondary())
    love.graphics.print("Secondary color", 30, 180)

    love.graphics.setColor(material.theme.getSecondaryContainer())
    love.graphics.rectangle("fill", 130, 170, 100, 50, 5, 5)
    love.graphics.setColor(material.theme.getOnSecondaryContainer())
    love.graphics.print("Secondary color", 140, 180)

    love.graphics.setColor(material.theme.getTertiary())
    love.graphics.rectangle("fill", 20, 240, 100, 50, 5, 5)
    love.graphics.setColor(material.theme.getOnTertiary())
    love.graphics.print("Tertiary color", 30, 250)

    love.graphics.setColor(material.theme.getTertiaryContainer())
    love.graphics.rectangle("fill", 130, 240, 100, 50, 5, 5)
    love.graphics.setColor(material.theme.getOnTertiaryContainer())
    love.graphics.print("Tertiary color", 140, 250)
end