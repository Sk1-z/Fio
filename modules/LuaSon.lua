Fs = require "modules.BetterFs"

local function parseKVP(str)
    local t = {}
    for key, value in string.gmatch(str, '"([^"]+)":%s*([^,}%s]*)') do
        if value == "true" or value == '"true"' then
            value = true
        elseif value == "false" or value == '"false"' then
            value = false
        end
        if type(value) == "string" then
            local num = tonumber(value:match("[-+]?%d+%.?%d*"))
            if num then
                value = num
            end
        end
        t[key] = value
    end
    return t
end

LuaSon = {}

function LuaSon:parseFile(path)
    return parseKVP(Fs:witho(path))
end

function LuaSon:parseString(str)
    return parseKVP(str)
end

function LuaSon:writeFile(t, path)
    Fs:witho(path, "make", LuaSon:writeString(t))
end

function LuaSon:writeString(t)
    local output = ""
    local first = true

    for key, value in pairs(t) do
        if not first then
            output = output .. ", "
        else
            first = false
        end
        output = output .. '"' .. tostring(key) .. '"' .. ':' .. '"' .. tostring(value) .. '"'
    end
    return '{' .. output .. '}'
end

return LuaSon
