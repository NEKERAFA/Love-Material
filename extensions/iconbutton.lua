local _material_ext_iconbutton = function (material, icon, options)
    -- Creates the new object
    local _object = {
        -- icon
        icon = icon,
        -- colors
        color = { 0, 0, 0, 0.54 },
        hoverColor = { 0, 0, 0, 0.87 },
        disableColor = { 0, 0, 0, 0.38 },
        backgroundColor = { 0, 0, 0, 0 },
        outlinedColor = { 0, 0, 0, 0 },
        rippleColor = { 0, 0, 0, 0.2 },
        -- state
        showOutlined = false,
        isDisabled = false,
        isHover = false,
        isClicked = false,
        -- ripple animation
        ripple = { enabled = true, state = "hide", dt = 0 },
        -- position
        x = 0, y = 0, z = 2
    };

    _object.update = function (self, dt)
        local _mouse_x, _mouse_y = love.mouse.getPosition()
        local _anim_dt_max = material.ext.animation.getTime()
    
        if self.isDisabled then
            if self.isHover then self.isHover = false end
            if self.isClicked then self.isClicked = false end
            if self.ripple.state ~= "hide" then self.ripple.state = "hide" end
        else
            -- Checks if button is hover
            self.isHover = material.utils.isinsidecircle(_mx, _my, x + _radius, y + _radius, _radius)
        
            -- Checks if user press the button
            self.isClicked = self.isHover and material.ext.isClicked

            -- Update ripple animation
            if self.ripple.state == "show" then
                self.ripple.dt = math.min(self.ripple.dt + dt, _anim_dt_max)
                if self.ripple.dt == _anim_dt_max then self.ripple.state = "hide" end
            end

            -- Start ripple animation
            if self.isClicked and self.ripple.enabled then
                self.ripple.state = "show"
                self.ripple.x = _mouse_x
                self.ripple.y = _mouse_y
            end
        end
    end

    _object.render = function (self)
        local _size = material.buttons.getPixelSize()
        local _anim_dt_max = material.animation.getTime()
        local _love_canvas = love.graphics.getCanvas()

        -- if canvas doesn't exists, create it
        if self.canvas == nil then self.canvas = love.graphics.newCanvas(_size, _size) end

        -- Clears the canvas
        love.graphics.setCanvas(self.canvas)
        love.graphics.clear()

        -- Set the colors
        material.colors.setBackgroundColor(self.backgroundColor)
        material.colors.setOutlinedColor(self.outlinedColor)
        material.colors.setRippleColor(self.rippleColor)
        material.colors.setHoverColor(self.hoverColor)
        material.colors.setDisabledColor(self.disableColor)
        material.colors.setColor(self.color)

        -- Draws the button
        material.buttons.iconbutton(self.icon, self.x, self.y, self.ripple.x, self.ripple.y, self.ripple.dt / _anim_dt_max * 40, self.showOutlined, self.hover, self.isDisabled)
    
        love.graphics.setCanvas(_love_canvas)
    end

    return _object
end

return _material_ext_iconbutton