return function ( material )

function _material_inputs_checkbox (x, y, ripple, checked, indeterminate, inactive, hover, focused)
    local _radius = material.inputs.getPixelSize() / 2
    local _iconSize = material.icons.getButtonSize()
    
    -- Background colors
    local _uncheckedBackgroundColor     = material.theme.getActiveOnSurface()
    local _checkedBackgroundColor       = material.theme.getSecondary()
    local _inactiveBackgroundColor      = material.theme.getInactiveOnSurface()
    local _indeterminateBackgroundColor = material.theme.getActiveSecondary()
    local _uncheckedSuface              = material.theme.getSurface()

    -- Ripple colors
    local _uncheckedRippleColor = material.theme.getRippleOnSurface()
    local _checkedRippleColor   = material.theme.getRippleSecondary()
    local _uncheckedHoverColor  = material.theme.getRippleOnSurface()
    local _checkedHoverColor    = material.theme.getRippleSecondary()
    local _uncheckedFocusColor  = material.theme.getInactiveOnSurface()
    local _checkedFocusColor    = material.theme.getInactiveSecondary()

    -- Item colors
    local _color          = material.theme.getActiveOnSecondary()
    local _inactiveColor = material.theme.getSurface()

    -- Checks optional args
    ripple        = math.min(ripple or 0, 1)
    checked       = checked or false
    indeterminate = indeterminate or false
    inactive      = inactive or false
    hover         = hover or false
    focused       = focused or false

    -- Icon fonts
    local _iconFont = material.icons.getButtonFont()

    local _love_color = { love.graphics.getColor() }
    local _love_font  = love.graphics.getFont()

    -- Draws the focus
    if focused then
        if inactive and not indeterminate then love.graphics.setColor(_uncheckedFocusColor)
        else love.graphics.setColor(_checkedFocusColor) end

        love.graphics.circle("fill", x + _radius, y + _radius, _radius)
    end

    -- Draws the focus
    if hover then
        if inactive and not indeterminate then love.graphics.setColor(_uncheckedHoverColor)
        else love.graphics.setColor(_checkedHoverColor) end
        love.graphics.circle("fill", x + _radius, y + _radius, _radius)
    end

    -- Draws the ripple
    if ripple > 0 then
        if checked then love.graphics.setColor(_checkedRippleColor)
        else love.graphics.setColor(_uncheckedRippleColor) end

        love.graphics.circle("fill", x + _radius, y + _radius, ripple * _radius)
    end

    -- Draws the background
    if not checked and not indeterminate then
        if inactive then love.graphics.setColor(_inactiveBackgroundColor)
        else love.graphics.setColor(_uncheckedBackgroundColor) end
        love.graphics.rectangle("fill", x + _radius - 10, y + _radius - 10, 20, 20, 4, 4)
        love.graphics.setColor(_uncheckedSuface)
        love.graphics.rectangle("fill", x + _radius - 8, y + _radius - 8, 16, 16, 2, 2)
    else
        if inactive and indeterminate then love.graphics.setColor(_indeterminateBackgroundColor)
        elseif inactive and checked then love.graphics.setColor(_inactiveBackgroundColor)
        else love.graphics.setColor(_checkedBackgroundColor) end
        love.graphics.rectangle("fill", x + _radius - 10, y + _radius - 10, 20, 20, 4, 4)
    end

    -- Draws the icon
    if checked or indeterminate then
        if inactive and checked then love.graphics.setColor(_inactiveColor)
        else love.graphics.setColor(_color) end

        love.graphics.setFont(_iconFont)
        if indeterminate then love.graphics.print(material.icons.codepoints["remove"], x + _radius - _iconSize / 2, y + _radius - _iconSize / 2)
        else love.graphics.print(material.icons.codepoints["done"], x + _radius - _iconSize / 2, y + _radius - _iconSize / 2) end
    end

    love.graphics.setColor(_love_color)
    love.graphics.setFont(_love_font)
end

return _material_inputs_checkbox

end