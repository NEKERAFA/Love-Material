local material = require "material"

function love.load()
    love.graphics.setBackgroundColor(material.theme.getBackground())
end

function love.draw()
    material.typography.label({"onbackground", "Hello world from Matërial"}, "headline", 10, 10, "medium")

    material.typography.label({"onbackground", "Elevated button states:"}, "body", 10, 100, "large")
    material.buttons.button("Enabled", 10, 125, "elevated", "enabled", 100)
    material.buttons.button("Disabled", 120, 125, "elevated", "disabled", 100)
    material.buttons.button("Hovered", 230, 125, "elevated", "hovered", 100)
    material.buttons.button("Focused", 340, 125, "elevated", "focused", 100)
    material.buttons.button("Pressed", 450, 125, "elevated", "pressed", 100)

    material.typography.label({"onbackground", "Filled button states:"}, "body", 10, 200, "large")
    material.buttons.button("Enabled", 10, 225, "filled", "enabled", 100)
    material.buttons.button("Disabled", 120, 225, "filled", "disabled", 100)
    material.buttons.button("Hovered", 230, 225, "filled", "hovered", 100)
    material.buttons.button("Focused", 340, 225, "filled", "focused", 100)
    material.buttons.button("Pressed", 450, 225, "filled", "pressed", 100)

    material.typography.label({"onbackground", "Filled Tonal button states:"}, "body", 10, 300, "large")
    material.buttons.button("Enabled", 10, 325, "filledtonal", "enabled", 100)
    material.buttons.button("Disabled", 120, 325, "filledtonal", "disabled", 100)
    material.buttons.button("Hovered", 230, 325, "filledtonal", "hovered", 100)
    material.buttons.button("Focused", 340, 325, "filledtonal", "focused", 100)
    material.buttons.button("Pressed", 450, 325, "filledtonal", "pressed", 100)

    material.typography.label({"onbackground", "Outline button states:"}, "body", 10, 400, "large")
    material.buttons.button("Enabled", 10, 425, "outline", "enabled", 100)
    material.buttons.button("Disabled", 120, 425, "outline", "disabled", 100)
    material.buttons.button("Hovered", 230, 425, "outline", "hovered", 100)
    material.buttons.button("Focused", 340, 425, "outline", "focused", 100)
    material.buttons.button("Pressed", 450, 425, "outline", "pressed", 100)

    material.typography.label({"onbackground", "Text button states:"}, "body", 10, 500, "large")
    material.buttons.button("Enabled", 10, 525, "text", "enabled", 100)
    material.buttons.button("Disabled", 120, 525, "text", "disabled", 100)
    material.buttons.button("Hovered", 230, 525, "text", "hovered", 100)
    material.buttons.button("Focused", 340, 525, "text", "focused", 100)
    material.buttons.button("Pressed", 450, 525, "text", "pressed", 100)
end