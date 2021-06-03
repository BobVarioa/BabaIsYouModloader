local class = module.use({"lib.class"})
local Verb = class()

function Verb:init (name, func) 
	self.name = name
	if type(func) == "function" then
		self.func = func
	end
end

return Verb