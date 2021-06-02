local Word = class()

-- Word:parse(x, y, options) --> 
function Word:parse(x, y, options)
	error("Word:parse must be overriden by the inherited class")
end

function Word:getParseDirection(dir)
	return dir
end

return Word
