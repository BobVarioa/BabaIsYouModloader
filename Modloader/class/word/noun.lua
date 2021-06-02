local EffectMap = class()

function EffectMap:init()

end

function EffectMap:add() 

end

function EffectMap:remove()

end

function EffectMap:flush()

end

function EffectMap:run(level, units)

end

local Word = module.use("class.word.word")

local Noun = Word:extend()

Noun.nouns = Array()

function Noun:init(name, tiledata, textdata)
    self.name = name
    self.effects = EffectMap()

    Noun.nouns:push(self)
end

-- the absolute name of each "member" of a noun
-- Ex.
-- local Baba = Noun("baba", {}, {}) -- omitted for brevity
-- Baba:getMembers() --> [ "baba" ]
function Noun:getMembers()
	return Array(self.name)
end

function Noun:addEffect(effect)
	self.effects:add(effect)
end

function Noun:removeEffect(effect)
	self.effects:remove(effect)
end

function Noun:clearEffects()
	self.effects:flush()
end

function Noun:runEffects(level, units)
	self.effects:run(level, units)
end

function Noun:toString()
    return self.name
end

return Noun
