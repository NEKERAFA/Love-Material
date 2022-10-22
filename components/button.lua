local button = function(material)
    local __elevated_styles = require(material._COMPONENTS .. ".button.elevated_styles")(material)
    local __filled_styles = require(material._COMPONENTS .. ".button.filled_styles")(material)
    local __filled_tonal_styles = require(material._COMPONENTS .. ".button.filled_tonal_styles")(material)
    local __outline_styles = require(material._COMPONENTS .. ".button.outline_styles")(material)
    local __text_styles = require(material._COMPONENTS .. ".button.text_styles")(material)

    local __style_selector = require(material._UTILS .. ".style_selector")

    local __material_buttons_button = function(content, x, y, variant, state, width)
        -- Checks content
        local _text, _icon
        if type(content) == "table" and #content == 2 then
            _icon = tostring(content[1]); _text = tostring(content[2])
        else
            _text = tostring(content)
        end

        -- Checks position
        x = assert(tonumber(x), "bad argument #2 to 'button' (number expected, got " .. type(x) .. ")")
        y = assert(tonumber(y), "bad argument #3 to 'button' (number expected, got " .. type(y) .. ")")

        -- Checks style
        local _styles = __elevated_styles
        if type(variant) == "string" then
            if variant == "filled" then
                _styles = __filled_styles
            elseif variant == "filledtonal" then
                _styles = __filled_tonal_styles
            elseif variant == "outline" then
                _styles = __outline_styles
            elseif variant == "text" then
                _styles = __text_styles
            elseif variant ~= "elevated" then
                error("bad argument #4 to 'button' ('elevated', 'filled', 'filledtonal', 'outline' or 'text' expected)")
            end
        elseif variant ~= nil then
            error("bad argument #4 to 'button' (string expected, got " .. type(variant) ")")
        end

        -- Checks status
        local _style = "enabled"
        if type(state) == "string" then
            assert(
                state == "enabled" or state == "disabled" or state == "hovered" or state == "focused" or state == "pressed",
                "bad argument #5 to 'button' ('enabled', 'disabled', 'hovered', 'focused' or 'pressed' expected)"
            )
            _style = state
        elseif state ~= nil then
            error("bad argument #5 to 'button' (string expected, got " .. type(state) .. ")")
        end

        -- Calculates width
        local _font = __style_selector(_styles, _style .. ".label.font")
        local _text_width = _font:getWidth(_text)
        local _padding_left = (_icon and __style_selector(_styles, _style .. ".icon.padding_left")) or __style_selector(_styles, _style .. ".label.padding_left")
        local _padding_right = (_icon and __style_selector(_styles, _style .. ".icon.padding_right")) or __style_selector(_styles, _style .. ".label.padding_right")
        local _spacing = (_icon and __style_selector(_styles, _style .. ".icon.spacing")) or 0
        local _min_width = _padding_left + ((_icon and 18 + _spacing) or 0) + _text_width + _padding_right
        if (width and width < _min_width) or not width then
            width = _min_width
        end

        local _old_color = { love.graphics.getColor() }

        -- Draws shadow
        local _elevation = __style_selector(_styles, _style .. ".container.elevation")
        if _elevation and _elevation > 0 then
            local _box_radius = _elevation * 2 - 1
            local _shadow = __style_selector(_styles, _style .. ".container.shadow")
            _shadow[4] = 0.25

            local height = 40 + _box_radius
            material.shadow.draw(x - _box_radius, y - _box_radius, width, height, _box_radius, function(rect_w, rect_h)
                love.graphics.setColor(_shadow)
                love.graphics.rectangle("fill", rect_w / 2 - width / 2, rect_h / 2 - height / 2, width, height, 20, 20, 16)
            end)
        end

        -- Draws container
        local _container_opacity = __style_selector(_styles, _style .. ".container.opacity")
        if _container_opacity and _container_opacity > 0 then
            local _container_color = __style_selector(_styles, _style .. ".container.color")
            _container_color[4] = _container_opacity

            love.graphics.setColor(_container_color)
            love.graphics.rectangle("fill", x, y, width, 40, 20, 20, 16)
        end

        -- Draws state layer
        local _container_state_layer_opacity = __style_selector(_styles, _style .. ".container.state_layer.opacity")
        if _container_state_layer_opacity then
            local _container_state_layer = __style_selector(_styles, _style .. ".container.state_layer.color")
            _container_state_layer[4] = _container_state_layer_opacity

            love.graphics.setColor(_container_state_layer)
            love.graphics.rectangle("fill", x, y, width, 40, 20, 20, 16)
        end

        -- Draws outline
        local _container_outline_opacity = __style_selector(_styles, _style .. ".container.outline.opacity")
        if _container_outline_opacity then
            local _old_linewidth = love.graphics.getLineWidth()

            local _container_outline = __style_selector(_styles, _style .. ".container.outline.color")
            _container_outline[4] = _container_outline_opacity

            local _container_outline_width = __style_selector(_styles, _style .. ".container.outline.width")
            love.graphics.setLineWidth(_container_outline_width)

            love.graphics.setColor(_container_outline)
            love.graphics.rectangle("line", x, y, width, 40, 20, 20, 16)

            love.graphics.setLineWidth(_old_linewidth)
        end

        love.graphics.setColor(_old_color)

        -- Draws content
        local _padding_top = 40 / 2 - _font:getHeight() / 2
        _padding_left = width / 2 - _text_width / 2
        if _icon then
            _padding_left = _text_width + (18 + _spacing) / 2
        end

        local _label = __style_selector(_styles, _style .. ".label.color")
        _label[4] = __style_selector(_styles, _style .. ".label.opacity")
        love.graphics.print({ _label, _text }, _font, x + _padding_left + ((_icon and 18 + _spacing) or 0), y + _padding_top)
    end

    return __material_buttons_button
end

return button