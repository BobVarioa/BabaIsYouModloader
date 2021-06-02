local Infix = class()

function Infix:init (name, func) 
	self.name = name
	if type(func) == "function" then
		self.func = func
	end
end

Word.Infix = Infix

return Infix