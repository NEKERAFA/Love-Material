local __material_filled_button_styles = function(material)
    local _styles = {
        _default = "enabled",
        enabled = {
            container = {
                color = material.theme.getSecondaryContainer(),
                opacity = 1
            },
            label = {
                color = material.theme.getOnSecondaryContainer(),
                opacity = 1,
                font = material.typography.getLabel("large"),
                padding_left = 24,
                padding_right = 24
            },
            icon = {
                color = material.theme.getOnSecondary(),
                opacity = 1,
                padding_left = 16,
                spacing = 8,
                padding_right = 24
            }
        },
        disabled = {
            container = {
                color = material.theme.getOnSurface(),
                opacity = 0.12
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
                    color = material.theme.getOnSecondaryContainer(),
                    opacity = 0.08
                },
                shadow = material.theme.getShadow(),
                elevation = 1
            },
            icon = {
                color = material.theme.getOnSecondaryContainer()
            }
        },
        focused = {
            container = {
                state_layer = {
                    color = material.theme.getOnSecondaryContainer(),
                    opacity = 0.12
                }
            },
            icon = {
                color = material.theme.getOnSecondaryContainer()
            }
        },
        pressed = {
            container = {
                state_layer = {
                    color = material.theme.getOnSecondaryContainer(),
                    opacity = 0.12
                }
            },
            icon = {
                color = material.theme.getOnSecondaryContainer()
            }
        },
    }

    return _styles
end

return __material_filled_button_styles