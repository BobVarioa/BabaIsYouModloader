local Infix = module.use({"class.word.infix"})

Infix("on", {
    name = "text_on",
    sprite = "text_on",
    sprite_in_root = true,
    unittype = "text",
    tiling = -1,
    type = 7,
    colour = {0, 1},
    active = {0, 3},
    tile = {4, 8},
    grid = {7, 4},
    layer = 20
}, 
function(left, right)
	return false -- Should really do more than this
end
)
