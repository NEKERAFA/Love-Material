return function ( material )

-- Defines the icon button stencil
local function _material_buttons_fab_stencil (x, y, radius)
    return function ()
        love.graphics.circle("fill", x, y, radius)
    end
end

-- Draws a icon button
local function _material_buttons_fab (icon, x, y, ripple, variant, elevation, inactive, hover, focused)
    local _buttonSize = material.buttons.getFabPixelSize()
    local _iconSize = material.icons.getSize()
    local _radius = _buttonSize / 2

    -- Button color
    local _backgroundColor, _outlinedColor, _color, _inactiveColor, _hoverColor, _rippleColor

    variant = variant or "contained"
    if variant == "contained" then
        _backgroundColor = material.theme.getSecondary()
        _outlinedColor   = false
        _color           = material.theme.getActiveOnSecondary()
        _inactiveColor   = material.theme.getInactiveOnSecondary()
        _hoverColor      = material.theme.getHoverOnSecondary()
        _rippleColor     = material.theme.getRippleOnSecondary()
    elseif variant == "outlined" then
        _backgroundColor = material.theme.getSurface()
        _outlinedColor   = material.theme.getSecondary()
        _color           = material.theme.getActiveSecondary()
        _inactiveColor   = material.theme.getInactiveSecondary()
        _hoverColor      = material.theme.getHoverSecondary()
        _rippleColor     = material.theme.getRippleSecondary()
    elseif variant == "text" then
        _backgroundColor = material.theme.getSurface()
        _outlinedColor   = false
        _color           = material.theme.getActiveSecondary()
        _inactiveColor   = material.theme.getInactiveSecondary()
        _hoverColor      = material.theme.getHoverSecondary()
        _rippleColor     = material.theme.getRippleSecondary()
    end

    -- Gets button fonts
    local _buttonFont = material.texts.getBody("sans")
    local _iconFont = material.icons.getFont()

    -- Checks optional args
    local _ripple_x = (ripple and ripple.x) or _radius
    local _ripple_y = (ripple and ripple.y) or _radius
    local _ripple_radius = (ripple and ripple.radius) or 0
    elevation = elevation or 6
    inactive = inactive or false
    hover = hover or false
    focused = focused or false

    local _shadow
    if elevation > 0 then
        _shadow = material.shadow(_buttonSize, _buttonSize, elevation, function (w, h)
            local _love_color = { love.graphics.getColor() }
            love.graphics.setColor(0, 0, 0)
            love.graphics.circle("fill", w / 2, h / 2, _radius)
            love.graphics.setColor(_love_color)
        end)
    end

    local _love_color = { love.graphics.getColor() }
    local _love_font = love.graphics.getFont()

    -- Draws the elevation
    if elevation > 0 then
        love.graphics.setColor(0, 0, 0, 0.2)
        love.graphics.draw(_shadow, x + (_buttonSize / 2) - (_shadow:getWidth() / 2), y + (_buttonSize / 2) - (_shadow:getHeight() / 2) + (elevation / 2))
    end

    -- Draws the focus
    if focused then
        love.graphics.setColor(_focusedColor)
        love.graphics.circle("line", x + _radius, y + _radius, _radius + 2)
    end

    -- Draws the background
    love.graphics.setColor(_backgroundColor)
    love.graphics.circle("fill", x + _radius, y + _radius, _radius)

    -- Draws the outlined
    if _outlinedColor then
        love.graphics.setColor(_outlinedColor)
        love.graphics.circle("line", x + _radius, y + _radius, _radius)
    end

    -- Draws the ripple
    love.graphics.stencil(_material_buttons_fab_stencil(x + _radius, y + _radius, _radius))
    love.graphics.setStencilTest("greater", 0)
    love.graphics.setColor(_rippleColor)
    love.graphics.circle("fill", x + _ripple_x, y + _ripple_y, _ripple_radius * _buttonSize)
    love.graphics.setStencilTest()

    -- Draws the icon
    if inactive then love.graphics.setColor(_inactiveColor)
    elseif hover then love.graphics.setColor(_hoverColor)
    else love.graphics.setColor(_color) end

    love.graphics.setFont(_iconFont)
    love.graphics.print(material.icons.codepoints[icon], x + _radius - (_iconSize / 2), y + _radius - (_iconSize / 2))

    if elevation > 0 then _shadow:release() end

    love.graphics.setColor(_love_color)
    love.graphics.setFont(_love_font)
end

return _material_buttons_fab

end