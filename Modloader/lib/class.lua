--[[
A modified version of [`class.lua`](https://github.com/jonstoler/class.lua)
--]]

local Class = {}
local helpers = module.use("lib.helpers")

-- default (empty) constructor
function Class:init(...) end

-- create a subclass
function Class:extend(obj)
	local obj = obj or {}

	helpers.copyTable(self, obj)

	obj._ = obj._ or {}

	local mt = {}

	-- create new objects directly, like o = Object()
	mt.__call = function(self, ...)
		return self:new(...)
	end

	-- allow for getters and setters
	mt.__index = function(table, key)
		local val = rawget(table._, key)
		if val and type(val) == "table" and (val.get ~= nil or val.value ~= nil) then
			if val.get then
				if type(val.get) == "function" then
					return val.get(table, val.value)
				else
					return val.get
				end
			elseif val.value then
				return val.value
			end
		else
			return val
		end
	end

	mt.__newindex = function(table, key, value)
		local val = rawget(table._, key)
		if val and type(val) == "table" and ((val.set ~= nil and val._ == nil) or val.value ~= nil) then
			local v = value
			if val.set then
				if type(val.set) == "function" then
					v = val.set(table, value, val.value)
				else
					v = val.set
				end
			end
			val.value = v
			if val and val.afterSet then val.afterSet(table, v) end
		else
			table._[key] = value
		end
	end

	mt.__tostring = function() 
		if obj.toString then return obj:toString() 
		else tostring(obj) end
	end

	
	-- allow for metatable access through the `__mt` property,..... I think
	helpers.copyTable(rawget(obj._, "__mt"), mt)

	setmetatable(obj, mt)

	return obj
end

-- set properties outside the constructor or other functions
function Class:set(prop, value)
	if not value and type(prop) == "table" then
		for k, v in pairs(prop) do
			rawset(self._, k, v)
		end
	else
		rawset(self._, prop, value)
	end
end

-- create an instance of an object with constructor parameters
function Class:new(...)
	local obj = self:extend({})
	if type(obj.init) == "function" then obj:init(...) end
	return obj
end


function class(attr)
	attr = attr or {}
	return Class:extend(attr)
end

return class