BetterFs = {}
-- Modes ["readall", "read", "write", "append", "make"]
function BetterFs:witho(path, mode, modearg)
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

return BetterFs
