local class = module.use({"lib.class"})
local Property = class()

function Property:init (name, func) 
	self.name = name
	if type(func) == "function" then
		self.func = func
	end
end

return Property