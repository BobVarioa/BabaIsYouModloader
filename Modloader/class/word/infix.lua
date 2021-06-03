local class = module.use({"lib.class"})
local Infix = class()

function Infix:init (name, func) 
	self.name = name
	if type(func) == "function" then
		self.func = func
	end
end

return Infix