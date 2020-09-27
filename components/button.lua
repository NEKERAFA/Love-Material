return function ( material )

-- Defines the button stencil
local function _material_buttons_button_stencil (x, y, width, height)
    return function ()
        love.graphics.rectangle("fill", x, y, width, height, 4, 4)
    end
end

-- Draws a button
local function _material_buttons_button (content, x, y, ripple, variant, width, elevation, inactive, hover, focused)
    -- Checks the content
    local _text, _icon
    if type(content) == "string" then
        _text = content
    elseif type(content) == "table" and #content == 2 then
        _icon = content[1]; _text = content[2]
    else
        error("content must be a string or table variable", 2)
    end

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

    local _focusedColor    = material.theme.getFocused()

    -- Gets button fonts and sizes
    local _buttonFont = material.texts.getBody("sans")
    local _buttonIconFont = material.icons.getButtonFont()

    local _buttonIconSize = material.icons.getButtonSize()
    
    -- Checks width argument
    if width == nil then
        width = _buttonFont:getWidth(_text)

        if _icon ~= nil then
            width = width + 8 + _buttonIconSize
        end
    end
    
    local _offset = 0
    if variant == "text" then
        _offset = ((material.buttons.getSize() == "normal") and 16) or 8
    else
        _offset = ((material.buttons.getSize() == "normal") and 32) or 16
    end

    local _width = math.max(64, width + _offset)
    local _dx = _width / 2 - width / 2
    local _height = material.buttons.getPixelSize()

    -- Checks optional args
    local _ripple_x = (ripple and ripple.x) or _width / 2
    local _ripple_y = (ripple and ripple.y) or _height / 2
    local _ripple_radius = math.min((ripple and ripple.radius) or 0, 1)
    elevation = elevation or (variant == "text" and 0) or 2
    inactive = inactive or false
    hover = hover or false
    focused = focused or false

    local _shadow
    if elevation > 0 then
        _shadow = material.shadow(_width, _height, elevation, function (w, h)
            local _love_color = { love.graphics.getColor() }
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.rectangle("fill", w / 2 - _width / 2, h / 2 - _height / 2, _width, _height, 4, 4)
            love.graphics.setColor(_love_color)
        end)
    end

    local _love_color = { love.graphics.getColor() }
    local _love_font = love.graphics.getFont()

    -- Draws the elevation
    if elevation > 0 then
        love.graphics.setColor(0, 0, 0, 0.1)
        love.graphics.draw(_shadow, x + (_width / 2) - (_shadow:getWidth() / 2), y + (_height / 2) - (_shadow:getHeight() / 2))
        love.graphics.setColor(0, 0, 0, 0.2)
        love.graphics.draw(_shadow, x + (_width / 2) - (_shadow:getWidth() / 2), y + (_height / 2) - (_shadow:getHeight() / 2) + elevation)
    end

    -- Draws the focus
    if focused then
        love.graphics.setColor(_focusedColor)
        love.graphics.rectangle("line", x - 1, y - 1, _width + 2, _height + 2, 4, 4)
    end

    -- Draws the outlined
    if _outlinedColor then
        love.graphics.setColor(_outlinedColor)
        love.graphics.rectangle("fill", x, y, _width, _height, 4, 4)
    end

    -- Draws the background
    love.graphics.setColor(_backgroundColor)
    if _outlinedColor then
        love.graphics.rectangle("fill", x + 2, y + 2, _width - 4, _height - 4, 2, 2)
    else
        love.graphics.rectangle("fill", x, y, _width, _height, 4, 4)
    end

    -- Draws the ripple
    if _ripple_radius > 0 then
        love.graphics.stencil(_material_buttons_button_stencil(x, y, _width, _height))
        love.graphics.setStencilTest("greater", 0)
        love.graphics.setColor(_rippleColor)
        love.graphics.circle("fill", x + _ripple_x, y + _ripple_y, _ripple_radius * _width * 2)
        love.graphics.setStencilTest()
    end

    -- Draws the icon and the text
    if inactive then love.graphics.setColor(_inactiveColor)
    elseif hover then love.graphics.setColor(_hoverColor)
    else love.graphics.setColor(_color) end

    if _icon ~= nil then
        love.graphics.setFont(_buttonIconFont)
        love.graphics.print(material.icons.codepoints[_icon], x + _dx, y + _height / 2 - _buttonIconSize / 2)
        _dx = _dx + _buttonIconSize + 8
    end

    love.graphics.setFont(_buttonFont)
    love.graphics.print(_text, x + _dx, y + _height / 2 - _buttonFont:getHeight() / 2)

    if elevation > 0 then _shadow:release() end

    love.graphics.setColor(_love_color)
    love.graphics.setFont(_love_font)
end

return _material_buttons_button

end