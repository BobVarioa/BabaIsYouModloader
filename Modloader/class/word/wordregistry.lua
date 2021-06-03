local class = module.use({"lib.class"})
local WordRegistry = class()

WordRegistry.words = {}

function WordRegistry:register(name, word)
	WordRegistry.words[string.match(name, "text_(.+)") or name] = word
end

function WordRegistry:get(name)
	return WordRegistry.words[string.match(name, "text_(.+)") or name]
end

return WordRegistry