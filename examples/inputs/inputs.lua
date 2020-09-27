local material = require "material"

local indeterminate = false
local inactive = false

local checkbox_status = {
    ripple = { radius = 0, dt = 0 },
    checked = false,
    hover = false,
    clicked = false,
    focused = false
}

local radio_status = {
    ripple = { radius = 0, dt = 0 },
    selected = false,
    hover = false,
    clicked = false,
    focused = false
}

local font = material.texts.getBody("sans")

function love.load()
    love.graphics.setBackgroundColor(material.theme.getBackground())
    love.graphics.setColor(material.theme.getActiveOnSurface())
    love.graphics.setFont(font)
end

function love.mousemoved(x, y)
    local size = material.inputs.getPixelSize()

    local checkbox_dx, checkbox_dy = 10 + size / 2 - x, 64 + size / 2 - y
    checkbox_status.hover = math.sqrt(checkbox_dx * checkbox_dx + checkbox_dy * checkbox_dy) <= size / 2

    local radio_dx, radio_dy = 10 + size + size / 2 - x, 64 + size / 2 - y
    radio_status.hover = math.sqrt(radio_dx * radio_dx + radio_dy * radio_dy) <= size / 2
end

function love.mousepressed(x, y)
    checkbox_status.clicked = checkbox_status.hover
    if checkbox_status.clicked then
        checkbox_status.checked = not checkbox_status.checked
        checkbox_status.ripple = { radius = 0, dt = 0 }
    end

    radio_status.clicked = radio_status.hover
    if radio_status.clicked then
        radio_status.selected = not radio_status.selected
        radio_status.ripple = { radius = 0, dt = 0 }
    end
end

function love.keypressed(key, scancode)
    if scancode == "q" then
        if material.inputs.getSize() == "normal" then
            material.inputs.setSize("small")
        else
            material.inputs.setSize("normal")
        end
    end

    if scancode == "w" then
        indeterminate = not indeterminate
    end

    if scancode == "e" then
        inactive = not inactive
    end
end

function love.update(dt)
    if checkbox_status.clicked then
        checkbox_status.ripple.dt = math.min(checkbox_status.ripple.dt + dt, 0.2)
        checkbox_status.ripple.radius = checkbox_status.ripple.dt / 0.2
        checkbox_status.clicked = checkbox_status.ripple.dt < 0.2
    end

    if radio_status.clicked then
        radio_status.ripple.dt = math.min(radio_status.ripple.dt + dt, 0.2)
        radio_status.ripple.radius = radio_status.ripple.dt / 0.2
        radio_status.clicked = radio_status.ripple.dt < 0.2
    end

    checkbox_status.focused = checkbox_status.clicked and not radio_status.clicked
    radio_status.focused = radio_status.clicked and not checkbox_status.clicked
end

function love.draw()
    love.graphics.print("Button size [Q]: " .. material.inputs.getSize(), 10, 10)
    love.graphics.print("Indeterminate Checkbox [W] \t Enable/Disable buttons [E]", 10, 26)

    local size = material.inputs.getPixelSize()

    material.theme.setRipple(0.2 - checkbox_status.ripple.dt)
    material.inputs.checkbox(10, 64, checkbox_status.ripple.radius, checkbox_status.checked, indeterminate, inactive, checkbox_status.hover, checkbox_status.focused)
    
    material.theme.setRipple(0.2 - radio_status.ripple.dt)
    material.inputs.radio(10 + size + 10, 64, radio_status.ripple.radius, radio_status.selected, inactive, radio_status.hover, radio_status.focused)
end