return function ( material )

-- Defines the icon button stencil
local function _material_buttons_iconbutton_stencil (x, y, radius)
    return function ()
        love.graphics.circle("fill", x, y, radius)
    end
end

-- Draws a icon button
local function _material_buttons_iconbutton (icon, x, y, ripple, inactive, hover, focused)
    local _size = material.buttons.getPixelSize()
    local _radius = _size / 2

    -- Background color
    local _backgroundColor = material.theme.getSurface()
    local _rippleColor     = material.theme.getRippleOnSurface()

    -- Icon color
    local _color           = material.theme.getActiveOnSurface()
    local _inactiveColor   = material.theme.getInactiveOnSurface()
    local _hoverColor      = material.theme.getHoverOnSurface()
    local _focusedColor    = material.theme.getFocused()

    local _iconFont = material.icons.getFont()
    local _iconSize = material.icons.getSize()

    -- Checks optional args
    local _ripple_x = (ripple and ripple.x) or _radius
    local _ripple_y = (ripple and ripple.y) or _radius
    local _ripple_radius = math.min((ripple and ripple.radius) or 0, 1)
    inactive = inactive or false
    hover = hover or false
    focused = focused or false

    local _love_color = { love.graphics.getColor() }
    local _love_font = love.graphics.getFont()

    -- Draws the focus
    if focused then
        love.graphics.setColor(_focusedColor)
        love.graphics.circle("line", x + _radius, y + _radius, _radius + 2)
    end

    -- Draws the background
    love.graphics.setColor(_backgroundColor)
    love.graphics.circle("fill", x + _radius, y + _radius, _radius)

    -- Draws the ripple
    if _ripple_radius > 0 then
        love.graphics.stencil(_material_buttons_iconbutton_stencil(x + _radius, y + _radius, _radius))
        love.graphics.setStencilTest("greater", 0)
        love.graphics.setColor(_rippleColor)
        love.graphics.circle("fill", x + _ripple_x, y + _ripple_y, _ripple_radius * _radius * 2)
        love.graphics.setStencilTest()
    end

    -- Draws the icon
    if inactive then love.graphics.setColor(_inactiveColor)
    elseif hover then love.graphics.setColor(_hoverColor)
    else love.graphics.setColor(_color) end

    love.graphics.setFont(_iconFont)
    love.graphics.print(material.icons.codepoints[icon], x + _radius - (_iconSize / 2), y + _radius - (_iconSize / 2))

    love.graphics.setColor(_love_color)
    love.graphics.setFont(_love_font)
end

return _material_buttons_iconbutton

end