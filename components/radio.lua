return function ( material )

function _material_inputs_radio (x, y, ripple, selected, inactive, hover, focused)
    local _radius = material.inputs.getPixelSize() / 2
    
    -- Background colors
    local _unselectedBackgroundColor = material.theme.getActiveOnSurface()
    local _selectedBackgroundColor   = material.theme.getSecondary()
    local _inactiveBackgroundColor   = material.theme.getInactiveOnSurface()
    local _surfaceColor               = material.theme.getSurface()

    -- Ripple colors
    local _unselectedRippleColor = material.theme.getRippleOnSurface()
    local _selectedRippleColor   = material.theme.getRippleSecondary()
    local _unselectedHoverColor  = material.theme.getRippleOnSurface()
    local _selectedHoverColor    = material.theme.getRippleSecondary()
    local _unselectedFocusColor  = material.theme.getInactiveOnSurface()
    local _selectedFocusColor    = material.theme.getInactiveSecondary()

    -- Checks optional args
    ripple   = math.min(ripple or 0, 1)
    selected = selected or false
    inactive = inactive or false
    hover    = hover or false
    focused  = focused or false

    local _love_color = { love.graphics.getColor() }

    -- Draws the focus
    if focused then
        if inactive then love.graphics.setColor(_unselectedFocusColor)
        else love.graphics.setColor(_selectedFocusColor) end

        love.graphics.circle("fill", x + _radius, y + _radius, _radius)
    end

    -- Draws the focus
    if hover then
        if inactive then love.graphics.setColor(_unselectedHoverColor)
        else love.graphics.setColor(_selectedHoverColor) end
        love.graphics.circle("fill", x + _radius, y + _radius, _radius)
    end

    -- Draws the ripple
    if ripple > 0 then
        if selected then love.graphics.setColor(_selectedRippleColor)
        else love.graphics.setColor(_unselectedRippleColor) end

        love.graphics.circle("fill", x + _radius, y + _radius, ripple * _radius)
    end

    -- Draws the background
    if inactive then love.graphics.setColor(_inactiveBackgroundColor)
    elseif not selected then love.graphics.setColor(_unselectedBackgroundColor)
    else love.graphics.setColor(_selectedBackgroundColor) end
    love.graphics.circle("fill", x + _radius, y + _radius, 10)
    love.graphics.setColor(_surfaceColor)
    love.graphics.circle("fill", x + _radius, y + _radius, 8)

    -- Draws the selection
    if selected then
        if inactive then love.graphics.setColor(_inactiveBackgroundColor)
        else love.graphics.setColor(_selectedBackgroundColor) end
        love.graphics.circle("fill", x + _radius, y + _radius, 6)
    end

    love.graphics.setColor(_love_color)
end

return _material_inputs_radio
    
end