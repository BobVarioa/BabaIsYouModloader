
local RuleBuilder = class()

function RuleBuilder:init(data)
	-- TODO
	self.data = data or {}
end

function RuleBuilder:add(word)

end

function RuleBuilder:split()
	return self, RuleBuilder(self.data)
end

return RuleBuilder