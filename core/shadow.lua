return function (material)

local _material_shadow_shader = love.graphics.newShader(material._ASSETS .. "/shaders/boxblur.glsl")

-- Creates a texture with the shadow effect
local function _material_shadow (width, height, radius, onDraw)

    local _love_canvas = love.graphics.getCanvas()
    local _love_shader = love.graphics.getShader()
    local _love_blendmode, _love_alphamode = love.graphics.getBlendMode()
    local _love_color = {love.graphics.getColor()}

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setBlendMode("alpha", "alphamultiply")

    -- Creates the texture
    local _shadowTexture = love.graphics.newCanvas(width + radius * 2, height + radius * 2)
    love.graphics.setCanvas(_shadowTexture)
    love.graphics.clear()
    onDraw(width + radius * 2, height + radius * 2)

    -- Creates the buffer
    local _buffer = love.graphics.newCanvas(width + radius * 2, height + radius * 2)

    -- Set the shader
    love.graphics.setShader(_material_shadow_shader)

    -- Draws the texture with horizontal blur
    love.graphics.setCanvas(_buffer)
    love.graphics.clear()
    _material_shadow_shader:send('direction', {1 / (width + radius * 2), 0})
    _material_shadow_shader:send("radius", math.floor(radius + 0.5))
    love.graphics.draw(_shadowTexture, 0, 0)

    -- Draws the texture with verticar blur
    love.graphics.setCanvas(_shadowTexture)
    love.graphics.clear()
    _material_shadow_shader:send('direction', {0, 1 / (height + radius * 2)})
    love.graphics.draw(_buffer, 0, 0)

    love.graphics.setShader(_love_shader)
    love.graphics.setCanvas(_love_canvas)
    love.graphics.setBlendMode(_love_blendmode, _love_alphamode)
    love.graphics.setColor(_love_color)

    _buffer:release()
    return _shadowTexture

end

return _material_shadow

end