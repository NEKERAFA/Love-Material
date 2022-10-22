local __material_filled_button_styles = function(material)
    local _styles = {
        _default = "enabled",
        enabled = {
            container = {
                outline = {
                    color = material.theme.getOutline(),
                    width = 1,
                    opacity = 1,
                }
            },
            label = {
                color = material.theme.getPrimary(),
                opacity = 1,
                font = material.typography.getLabel("large"),
                padding_left = 24,
                padding_right = 24,
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
                outline = {
                    color = material.theme.getOnSurface(),
                    opacity = 0.12
                }
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
                }
            }
        },
        focused = {
            container = {
                outline = {
                    color = material.theme.getPrimary()
                },
                state_layer = {
                    color = material.theme.getOnSecondaryContainer(),
                    opacity = 0.12
                }
            }
        },
        pressed = {
            container = {
                state_layer = {
                    color = material.theme.getOnSecondaryContainer(),
                    opacity = 0.12
                }
            }
        },
    }

    return _styles
end

return __material_filled_button_styles