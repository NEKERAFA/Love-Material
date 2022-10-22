local __material_elevated_button_styles = function(material)
    local _styles = {
        _default = "enabled",
        enabled = {
            container = {
                color = material.theme.getSurface(),
                opacity = 1,
                shadow = material.theme.getShadow(),
                elevation = 1
            },
            label = {
                color = material.theme.getPrimary(),
                opacity = 1,
                font = material.typography.getLabel("large"),
                padding_left = 24,
                padding_right = 24
            },
            icon = {
                color = material.theme.getPrimary(),
                opacity = 1,
                padding_left = 16,
                spacing = 8,
                padding_right = 24
            }
        },
        disabled = {
            container = {
                color = material.theme.getOnSurface(),
                opacity = 0.12,
                elevation = 0
            },
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
                },
                elevation = 2
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
        },
    }

    return _styles
end

return __material_elevated_button_styles