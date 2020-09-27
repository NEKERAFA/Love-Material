local material = require "material"

local show_icon = false
local show_elevation = true
local inactive = false
local elevation = 0.2
local variant = "contained"

local ib_status = {
    ripple = { x = 0, y = 0, radius = 0, dt = 0 },
    hover = false,
    clicked = false,
    focused = false
}

local fab_status = {
    ripple = { x = 0, y = 0, radius = 0, dt = 0 },
    hover = false,
    clicked = false,
    focused = false
}

local button_status = {
    ripple = { x = 0, y = 0, radius = 0, dt = 0 },
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
    local ib_radius = material.buttons.getIconButtonPixelSize() / 2
    local ib_dx, ib_dy = 10 + ib_radius - x, 80 + ib_radius - y
    ib_status.hover = math.sqrt(ib_dx * ib_dx + ib_dy * ib_dy) <= ib_radius

    local fab_radius = material.buttons.getFabPixelSize() / 2
    local fab_dx, fab_dy = 100 + fab_radius - x, 80 + fab_radius - y
    fab_status.hover = math.sqrt(fab_dx * fab_dx + fab_dy * fab_dy) <= fab_radius

    local button_textWidth = font:getWidth("PRESS HERE")
    local button_normalSize = material.buttons.getSize() == "normal"
    local button_iconWitdh = material.icons.getButtonSize()
    local button_height = material.buttons.getPixelSize()
    local button_offset = (variant == "text" and ((button_normalSize and 16) or 8)) or ((button_normalSize and 32) or 16)
    button_status.hover = x >= 10 and x <= 10 + ((show_icon and button_iconWitdh) or 0) + button_textWidth + button_offset and y >= 166 and y <= 166 + button_height
end

function love.mousepressed(x, y)
    ib_status.clicked = ib_status.hover
    if ib_status.clicked then
        ib_status.ripple = {x = x, y = y, radius = 0, dt = 0}
    end

    fab_status.clicked = fab_status.hover
    if fab_status.clicked then
        fab_status.ripple = {x = x, y = y, radius = 0, dt = 0}
    end

    button_status.clicked = button_status.hover
    if button_status.clicked then
        button_status.ripple = {x = x, y = y, radius = 0, dt = 0}
    end

    ib_status.focused = ib_status.clicked and not fab_status.clicked and not button_status.clicked
    fab_status.focused = fab_status.clicked and not ib_status.clicked and not button_status.clicked
    button_status.focused = button_status.clicked and not ib_status.clicked and not fab_status.clicked
end

function love.keypressed(key, scancode)
    if scancode == "q" then
        if variant == "contained" then
            variant = "outlined"
        elseif variant == "outlined" then
            variant = "text"
        else
            variant = "contained"
        end
    end

    if scancode == "w" then
        if material.buttons.getSize() == "normal" then
            material.buttons.setSize("small")
        else
            material.buttons.setSize("normal")
        end
    end
    
    if scancode == "e" then
        inactive = not inactive
    end

    if scancode == "r" then
        show_icon = not show_icon
    end

    if scancode == "t" then
        show_elevation = not show_elevation
    end
end

function love.update(dt)
    if show_elevation and elevation < 0.2 then
        elevation = math.min(elevation + dt, 0.2)
    elseif not show_elevation and elevation > 0 then
        elevation = math.max(elevation - dt, 0)
    end

    if ib_status.clicked then
        ib_status.ripple.dt = math.min(ib_status.ripple.dt + dt, 0.2)
        ib_status.ripple.radius = ib_status.ripple.dt / 0.2
        ib_status.clicked = ib_status.ripple.dt < 0.2
    end

    if fab_status.clicked then
        fab_status.ripple.dt = math.min(fab_status.ripple.dt + dt, 0.2)
        fab_status.ripple.radius = fab_status.ripple.dt / 0.2
        fab_status.clicked = fab_status.ripple.dt < 0.2
    end

    if button_status.clicked then
        button_status.ripple.dt = math.min(button_status.ripple.dt + dt, 0.2)
        button_status.ripple.radius = button_status.ripple.dt / 0.2
        button_status.clicked = button_status.ripple.dt < 0.2
    end
end

function love.draw()
    love.graphics.print("Button variant [Q]: " .. variant, 10, 10)
    love.graphics.print("Button size [W]: " .. material.buttons.getSize(), 200, 10)
    love.graphics.print("Enable/Disable buttons [E] \t Show icon [R] \t Show elevation [T]", 10, 26)

    love.graphics.print("Icon Button:", 10, 64)
    material.theme.setRipple(0.2 - ib_status.ripple.dt)
    material.buttons.iconButton("alarm", 10, 80, ib_status.ripple, inactive, ib_status.hover, ib_status.focused)

    love.graphics.print("Foating Action Button:", 100, 64)
    material.theme.setRipple(0.2 - fab_status.ripple.dt)
    material.buttons.floatingActionButton("alarm_add", 100, 80, fab_status.ripple, variant, elevation / 0.2 * 6, inactive, fab_status.hover, fab_status.focused)

    local content
    if show_icon then
        content = {"alarm_off", "PRESS HERE"}
    else
        content = "PRESS HERE"
    end

    love.graphics.print("Button:", 10, 150)
    material.theme.setRipple(0.2 - button_status.ripple.dt)
    material.buttons.button(content, 10, 166, button_status.ripple, variant, nil, elevation / 0.2 * 2, inactive, button_status.hover, button_status.focused)
end