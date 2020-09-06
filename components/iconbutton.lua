local _material_buttons_iconbutton_stencil = function (x, y, radius)
    return function ()
        love.graphics.circle("fill", x, y, radius)
    end
end

-- Draws a icon button
local _material_buttons_iconbutton = function (material, icon, x, y, ripple_x, ripple_y, ripple_radius, outlined, hover, disabled)
    local _size = material.buttons.getPixelSize()
    local _radius = _size / 2

    local _backgroundColor = material.colors.getBackgroundColor()
    local _outlinedColor = material.colors.getOutlinedColor()
    local _rippleColor = material.colors.getRippleColor()
    local _hoverColor = material.colors.getHoverColor()
    local _disableColor = material.color.getDisableColor()
    local _color = material.color.getColor()

    local _iconFont = material.icons.getFont()

    -- Checks optional args
    ripple_x = ripple_x or _radius
    ripple_y = ripple_y or _radius
    ripple_radius = ripple_radius or 0
    hover = hover or false
    outlined = outlined or false
    disabled = disabled or false

    local _love_color = { love.graphics.getColor() }
    local _love_font = love.graphics.getFont()

    -- Draws the background
    love.graphics.setColor(_backgroundColor)
    love.graphics.circle("fill", x + _radius, y + _radius, _radius)

    -- Draws the ripple
    love.graphics.stencil(material_iconbutton_stencil(x + _radius, y + _radius, _radius))
    love.graphics.setStencilTest("greater", 0)
    love.graphics.setColor(_rippleColor)
    love.graphics.circle("fill", x + ripple_x, y + ripple_y, ripple_radius)
    love.graphics.setStencilTest()

    -- Draws the border
    if outlined and hover then
        love.graphics.setColor(_outlinedColor)
        love.graphics.circle("line", x + _radius, y + _radius, _radius)
    end

    -- Draws the icon
    if disabled then love.graphics.setColor(_disableColor)
    elseif hover then love.graphics.setColor(_hoverColor)
    else love.graphics.setColor(_color) end
    love.graphics.setFont(_iconFont)
    love.graphics.print(material.icons.codepoints[icon], x + _radius - 20, y + _radius - 20)

    love.graphics.setColor(_love_color)
    love.graphics.setFont(_love_font)
end

return _material_buttons_iconbutton