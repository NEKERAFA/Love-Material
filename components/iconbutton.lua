return function ( material )

-- Defines the icon button stencil
local function _material_buttons_iconbutton_stencil (x, y, radius)
    return function ()
        love.graphics.circle("fill", x, y, radius)
    end
end

-- Draws a icon button
local function _material_buttons_iconbutton (icon, x, y, ripple_x, ripple_y, ripple_radius, outlined, inactive, focused)
    local _size = material.buttons.getPixelSize()
    local _radius = _size / 2

    local _backgroundColor = material.theme.getSurface()
    local _outlinedColor   = material.theme.getOnSurface()
    local _rippleColor     = material.theme.getSurfaceRipple()
    local _color           = material.theme.getActive()
    local _inactiveColor   = material.theme.getInactive()
    local _focusedColor    = material.theme.getFocused()

    local _iconFont = material.icons.getFont()
    local _iconSize = material.icons.getSize()

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
    love.graphics.stencil(_material_buttons_iconbutton_stencil(x + _radius, y + _radius, _radius))
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
    if inactive then love.graphics.setColor(_inactiveColor)
    elseif focused then love.graphics.setColor(_focusedColor)
    else love.graphics.setColor(_color) end

    love.graphics.setFont(_iconFont)
    love.graphics.print(material.icons.codepoints[icon], x + _radius - (_iconSize / 2), y + _radius - (_iconSize / 2))

    if inactive then _c = _inactiveColor
    elseif focused then _c = _focusedColor
    else _c = _color end

    love.graphics.setColor(_love_color)
    love.graphics.setFont(_love_font)
end

return _material_buttons_iconbutton

end