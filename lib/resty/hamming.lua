-- Copyright (C) by Kwanhur Huang


local modulename = 'restyHamming'
local _M = {}
_M._VERSION = '0.0.1'
_M._NAME = modulename


local byte = string.byte
local insert = table.insert
local floor = math.floor
local ipairs = ipairs

_M.distance = function(str1, str2)
    local dis = 0
    if #str1 ~= #str2 then
        return dis
    end
    for i = 1, #str1 do
        if byte(str1, i) ~= byte(str2, i) then
            dis = dis + 1
        end
    end
    return dis
end

local convert = function(n, x)

    local function fn(num, t)
        if (num < x) then
            insert(t, num)
        else
            fn(floor(num / x), t)
            insert(t, num % x)
        end
    end

    local x_t = {}
    fn(n, x_t)

    return x_t
end

_M.weight = function(str)
    local wgt = 0
    for i = 1, #str do
        local t = convert(byte(str, i), 2)
        for _, v in ipairs(t) do
            if v == 1 then
                wgt = wgt + 1
            end
        end
    end
    return wgt
end

return _M