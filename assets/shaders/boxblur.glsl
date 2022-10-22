// Based on box blur shader of moonshine
// Reference: https://github.com/vrld/moonshine

#ifdef PIXEL

extern vec2 direction;
extern float radius;

vec4 effect (vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
    vec4 pixel_color = vec4(0.0);

    for (float i = -radius; i <= radius; i += 1.0)
    {
        pixel_color += Texel(texture, texture_coords + i * direction); 
    }

    return pixel_color / (2.0 * radius + 1.0) * color;
}

#endif