local Prefix = module.use("class.word.prefix")

Prefix("lonely", {
    name = "text_lonely",
    sprite = "text_lonely",
    sprite_in_root = true,
    unittype = "text",
    tiling = -1,
    type = 3,
    colour = {2, 1},
    active = {2, 2},
    tile = {10, 0},
    grid = {9, 4},
    layer = 20
}, 
function(operand)
	return false -- Should really check for something
end
)
