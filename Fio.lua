Fio = {}
-- Modes ["readall", "read", "write", "append", "make"]
function Fio:witho(path, mode, modearg)
    if path == nil then
        error("path cannot be nil")
    end
    if not io.open(path) and mode ~= "make" then
        error("File not found")
    end
    if mode == nil then
        mode = "readall"
    end

    local out = ""
    if mode == "readall" then
        local f = io.open(path)
        io.input(f)
        out = io.read("*a")
        io.close(f)
        return out
    elseif mode == "read" then
        local f = io.open(path)
        io.input(f)
        local n = 0
        while n < modearg do
            local line = io.read()
            if line then
                out = out .. line .. "\n"
                n = n + 1
            else
                error(string.format("file has less than %i lines", modearg))
            end
        end
        io.close(f)
        return out
    elseif mode == "write" then
        local f = io.open(path, "w")
        io.output(f)
        io.write(modearg)
        io.close(f)
    elseif mode == "append" then
        local f = io.open(path, "a")
        io.output(f)
        io.write(modearg)
        io.close(f)
    elseif mode == "make" then
        local f = io.open(path, "w")
        io.output(f)
        io.write(modearg)
        io.close(f)
    else
        error("Invalide 'mode' argument -- Modes ['read', 'readall', 'write', 'append', 'make']")
    end
end

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

function Fio:parseFile(path)
    return parseKVP(Fio:witho(path))
end

function Fio:parseString(str)
    return parseKVP(str)
end

function Fio:writeFile(t, path)
    Fio:witho(path, "make", Fio:writeString(t))
end

function Fio:writeString(t)
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

return Fio
