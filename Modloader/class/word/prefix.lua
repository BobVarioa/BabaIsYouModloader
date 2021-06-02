local Prefix = class()

function Prefix:init (name, func) 
	self.name = name
	if type(func) == "function" then
		self.func = func
	end
end

Word.Prefix = Prefix

return Prefix