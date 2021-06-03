--[[

BABA IS YOU MODLOADER 
- Bob Varioa

--]] --[[
# Overview

### Modules
The global table `module` has a utility method to import files, called `module.use`. This is the function that you 

--]]
ENUM = {}

local options = {
    readonly_globals = true
}

setmetatable(_G, {
    __newindex = function(t, n, v)
        if not options.readonly_globals then
            rawset(t, n, v)
        end
    end
})

module = {
    data = {},
    base = "Data/Worlds/" .. generaldata.strings[WORLD] .. "/Lua/Modloader/"
}

table.unpack = table.unpack or unpack

-- module.use("path.to.file" or {"path.to.file"}, raw?)
function module.use(input, raw)
    if type(input) == "table" and #input ~= 0 then
        local path
        if raw then
            path = input[1]
        else
            path = string.gsub((string.match(input[1], '(.+)%.lua$') or input[1]), "%.", "/") .. ".lua"
        end

        local final = module.base .. path
        if not module.data[final] then
            options["readonly_globals"] = true
            module.data[final] = dofile(final) or true
            options["readonly_globals"] = false
        end
        return module.data[final], module.use({table.unpack(input, 2)})
    elseif type(input) ~= "nil" then
        return module.use({input}, raw)
    end
end

module.use("data.index")

-- blocks.lua
-- syntax.lua

--[[
	The only hardcoded words are:
	not, and
--]]

local modBase = "Data/Worlds/" .. generaldata.strings[WORLD] .. "/Lua/Mods/"
mods = {}

for i, modName in ipairs(MF_dirlist(modBase .. "*")) do
    options["readonly_globals"] = true
    local mod = dofile(modBase .. string.sub(modName, 2, string.len(modName) - 1) .. "/index.lua")
    options["readonly_globals"] = false
    if type(mod) ~= "boolean" and mod then
        mod.id = i
        mods[i] = mod
        if mod.init then
            mod.init()
        end
        print("Loaded mod " .. i .. ": " .. mod.name)
    end
end

