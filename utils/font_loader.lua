local font_loader = function(material)
    ---
    -- Loads a font using his family, style and size
    -- @function load
    -- @param data an font data object size in dpi
    -- @param [opt]path path where find the font
    local __font_loader_load = function(data, path)
        if not path then
            path = material._ASSETS .. "/fonts"
        end

        local names = {}
        for str in string.gmatch(data.font, "%a+") do
            table.insert(names, str)
        end
        local names_length = #names

        local name = ""
        for i = 1, names_length do
            name = name .. names[i]
        end
        local style = ""
        local weight = "Regular"

        -- Checks for fonts like "Ubuntu-Regular.ttf" or "NotoSans-Regular.ttf"
        local file = name .. "/" .. name .. "-" .. weight .. style .. ".ttf"
        if not love.filesystem.getInfo(path .. "/" .. file) then
            name = ""
            for i = 1, names_length - 1 do
                name = name .. names[i]
            end
            weight = names[names_length]

            -- Checks for fonts like "Roboto-Medium.ttf"
            file = name .. "/" .. name .. "-" .. weight .. style .. ".ttf"
            if not love.filesystem.getInfo(path .. "/" .. file) then
                name = ""
                for i = 1, names_length - 2 do
                    name = name .. names[i]
                end
                weight = names[names_length - 1]
                style = names[names_length]

                -- Fonts like "NotoSans-RegularItalic.ttf"
                file = name .. "/" .. name .. "-" .. weight .. style .. ".ttf"
            end
        end

        local font = love.graphics.newFont(path .. "/" .. file, data.size)
        font:setLineHeight(data.line_height / data.size)
        return font
    end

    return __font_loader_load
end

return font_loader