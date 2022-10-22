local style_selector = function(style, route)
    if style._default then
        assert(style[style._default], ("style must contain %q key"):format(style._default))
    end

    local path, path_size = {}, 0
    for key in route:gmatch("[^%.]+") do
        table.insert(path, key)
        path_size = path_size + 1
    end

    local find_default = false
    local value = style
    local index = 1
    while index <= path_size do
        if value[path[index]] ~= nil then
            -- Parent found, getting child
            value = value[path[index]]
            index = index + 1 -- Searching next parent, or finishing the search
        else
            if find_default then
                -- Finish search, value not found
                value = nil
                index = path_size + 1
            else
                -- Start to find in default value
                find_default = true
                value = style[style._default]
                index = 2 -- Removing first key because we are in default parent
            end
        end
    end

    return value
end

return style_selector