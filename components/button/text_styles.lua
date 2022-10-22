local __material_text_button_styles = function(material)
    local _styles = {
        _default = "enabled",
        enabled = {
            label = {
                color = material.theme.getPrimary(),
                opacity = 1,
                font = material.typography.getLabel("large"),
                padding_left = 12,
                padding_right = 12,
            },
            icon = {
                color = material.theme.getPrimary(),
                opacity = 1,
                padding_left = 12,
                spacing = 8,
                padding_right = 24
            }
        },
        disabled = {
            label = {
                color = material.theme.getOnSurface(),
                opacity = 0.38
            },
            icon = {
                color = material.theme.getOnSurface(),
                opacity = 0.38
            }
        },
        hovered = {
            container = {
                state_layer = {
                    color = material.theme.getPrimary(),
                    opacity = 0.08
                }
            }
        },
        focused = {
            container = {
                state_layer = {
                    color = material.theme.getPrimary(),
                    opacity = 0.12
                }
            }
        },
        pressed = {
            container = {
                state_layer = {
                    color = material.theme.getPrimary(),
                    opacity = 0.12
                }
            }
        }
    }

    return _styles
end

return __material_text_button_styles