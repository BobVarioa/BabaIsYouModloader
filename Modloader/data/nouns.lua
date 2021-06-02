local Noun = module.use("class.word.noun")

Noun("baba", {
    --[[ 
		autogenerates : 
		name / sprite = "baba", 
		unittype = "object", 
		type = ENUM.OBJECTS.TYPE.OBJECT
	--]]
    sprite_in_root = true,
    tiling = 2,
    colour = {0, 3},
    tile = {1, 0},
    grid = {0, 1},
    layer = 18
}, {
    --[[
		autogenerates : 
		name / sprite = "text_baba", 
		unittype = "text", 
		type = ENUM.OBJECTS.TYPE.OBJECT

		though these can be overriden
	--]]
    sprite_in_root = true,
    tiling = -1,
    colour = {4, 0},
    active = {4, 1},
    tile = {9, 1},
    grid = {1, 1},
    layer = 20
})
