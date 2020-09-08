return function ( material )

-- Defines the button stencil
local function _material_buttons_button_stencil (x, y, width, height)
    return function ()
        love.graphics.rectangle("fill", x, y, width, height, 4, 4)
    end
end

-- Draws a button
local function _material_buttons_button (content, x, y, ripple_x, ripple_y, ripple_radius, variant, width, inactive, hover, focused)
    -- Checks the content
    local _text, _icon
    if type(content) == "string" then
        _text = content
    elseif type(content) == "table" then
        _text = content[1]; _icon = content[2]
    else
        error("content must be a string or table variable", 2)
    end

    -- Button color
    local _backgroundColor, _outlinedColor, _color, _inactiveColor, _hoverColor, _rippleColor

    variant = variable or "contained"
    if variant == "contained" then
        _backgroundColor = material.theme.getSecondary()
        _outlinedColor   = false
        _color           = material.theme.getActiveOnSecondary()
        _inactiveColor   = material.theme.getInativeOnSecondary()
        _hoverColor      = material.theme.getHoverOnSecondary()
        _rippleColor     = material.theme.getRippleOnSecondary()
    elseif variant == "outlined" then
        _backgroundColor = material.theme.getSurface()
        _outlinedColor   = material.theme.getSecondary()
        _color           = material.theme.getActiveSecondary()
        _inactiveColor   = material.theme.getInactiveSecondary()
        _hoverColor      = material.theme.getHoverSecondary()
        _rippleColor     = material.theme.getRippleOnSurface()
    elseif variant == "text" then
        _backgroundColor = material.theme.getSurface()
        _outlinedColor   = false
        _color           = material.theme.getActiveSecondary()
        _inactiveColor   = material.theme.getInactiveSecondary()
        _hoverColor      = material.theme.getHoverSecondary()
        _rippleColor     = material.theme.getRippleOnSurface()
    end

    local _focusedColor    = material.theme.getFocused()

    -- Gets button font
    local _buttonFont = material.texts.getBody("sans")
    local _buttonIconFont = material.icons.getButtonFont()

    -- Checks optional args
    ripple_x = ripple_x or _radius
    ripple_y = ripple_y or _radius
    ripple_radius = ripple_radius or 0
    inactive = inactive or false
    hover = hover or false
    focused = focused or false
    
    -- Checks width argument
    local _offset
    if width == nil then
        width = _buttonFont:getWidth(_text)

        if _icon == nil then
            if variant == "text" then
                _offset = 16
            else
                _offset = 32
            end
        else
            width = width + 8 + material.icons.getButtonSize()
            if variant == "text" then
                _offset = 16
            else
                _offset = 28
            end
        end
    end

    local _width = math.max(64, width + _offset)
    local _dx = _width / 2 - width / 2
    local _height = material.buttons.getPixelSize()

    local _love_color = { love.graphics.getColor() }
    local _love_font = love.graphics.getFont()

    -- Draws the focus
    if _focusedColor then
        love.graphics.setColor(_focusedColor)
        love.graphics.rectangle("line", x-1, y-1, _width+2, _height+2, 4, 4)
    end

    -- Draws the background
    love.graphics.setColor(_backgroundColor)
    love.graphics.rectangle("fill", x, y, _width, _height, 4, 4)

    -- Draws the outlined
    if _outlinedColor then
        love.graphics.setColor(_outlinedColor)
        love.graphics.rectangle("fill", x, y, _width, _height, 4, 4)
    end

    -- Draws the ripple
    love.graphics.stencil(_material_buttons_button_stencil(x, y, _width, _height))
    love.graphics.setStencilTest("greater", 0)
    love.graphics.setColor(_rippleColor)
    love.graphics.circle("fill", x + ripple_x, y + ripple_y, ripple_radius * _radius * 2)
    love.graphics.setStencilTest()

    -- Draws the icon and the text
    if inactive then love.graphics.setColor(_inactiveColor)
    elseif hover then love.graphics.setColor(_hoverColor)
    else love.graphics.setColor(_color) end

    if type(_icon) == "string" then
        love.graphics.setFont(_buttonIconFont)
        love.graphics.print(material.icons.codepoints[_icon], x + dx, y + _height / 2 - material.icons.getButtonSize() / 2)
        dx = dx + material.icon.getButtonSize() + 8
    elseif _icon ~= nil then
        _iconWidth = material.icons.getButtonSize()
        _iconHeight = material.icons.getButtonSize()

        if _iconHeight > _iconWidth then
            _iconHeight = _icon:getWidth() * material.icons.getButtonSize() / _icon:getHeight()
        end

        love.graphics.draw(_icon, x + dx, y + _height / 2 - _iconHeight / 2, 0, _iconWidth / _icon:getWidth(), _iconHeight / _icon:getHeight())
        dx = dx + material.icon.getButtonSize() + 8
    end

    love.graphics.setFont(_buttonFont)
    love.graphics.print(_text, x + dx, y + _height / 2 - _buttonFont:getHeight() / 2)

    love.graphics.setColor(_love_color)
    love.graphics.setFont(_love_font)
end

end