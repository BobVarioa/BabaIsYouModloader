local WordRegistry = class()

WordRegistry.words = {}

function WordRegistry:register(name, word)
	WordRegistry.words[find(name, "text_(.+)")] = word
end

function WordRegistry:get(name)
	return WordRegistry.words[find(name, "text_(.+)")]
end

return WordRegistry