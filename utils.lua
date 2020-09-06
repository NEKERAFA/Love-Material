local _utils = {}

-- Gets the distance between two points
_utils.distance = function (x1, y1, x2, y2)
    local _dx = x1 - x2
    local _dy = y1 - y2
    return math.sqrt(_dx * _dx + _dy * _dy)
end

-- Gets if a point is inside a circle
_utils.isinsidecircle = function (x, y, cicle_x, circle_y, radius)
    return _utils.distance(cicle_x, circle_y, x, y) <= radius
end

-- Gets if a point is inside a rectangle
_utils.isinsiderectangle = function (x, y, rect_x, rect_y, width, height)
    return x >= rect_x and x <= rect_x + width and y >= rect_y and y <= rect_y + height
end

return utils