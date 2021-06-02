--[[

BABA IS YOU MODLOADER 
- Bob Varioa

--]]

--[[
# Overview

### Modules
The global table `module` has a utility method to import files, called `module.use` 

--]]



module = {
    data = {},
    base = "Data/Worlds/" .. generaldata.strings[WORLD] .. "/Lua/Modloader/"
}

-- module.use("path.to.file", raw?)
function module.use(input, raw)
    local path
    if raw then
        path = input
    else
        local file = string.match(input, '(.+)%.lua$') or input
        path = string.gsub(file, "%.", "/") .. ".lua"
    end

    local final = module.base .. path
    if not module.data[final] then
        module.data[final] = dofile(final) or true
    end
    return module.data[final]
end

module.use("index")

-- blocks.lua
-- syntax.lua

--[[
	The only hardcoded words are:
	not, and
--]]

local modBase = "Data/Worlds/" .. generaldata.strings[WORLD] .. "/Lua/Mods/"
mods = {}

for i, modName in ipairs(MF_dirlist(modBase .. "*")) do
    local mod = dofile(modBase .. string.sub(modName, 2, string.len(modName) - 1) .. "/index.lua")
    if type(mod) ~= "boolean" and mod then
        mod.id = i
        mods[i] = mod
        if mod.init then
            mod.init()
        end
        print("Loaded mod " .. i .. ": " .. mod.name)
    end
end

