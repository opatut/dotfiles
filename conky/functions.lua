function conky_format(format, number)
    local num = tonumber(conky_parse(number))
    if num == nil then num = 0 end
    return string.format(format, num)
end
