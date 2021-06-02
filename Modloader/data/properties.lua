local Property = module.use("class.word.property")

Property("you", {
    name = "text_you",
    sprite = "text_you",
    sprite_in_root = true,
    unittype = "text",
    tiling = -1,
    type = 2,
    colour = {4, 0},
    active = {4, 1},
    tile = {11, 4},
    grid = {2, 1},
    layer = 20
}, 
function (units)
	for i, v in ipairs(units) do
		-- Do something
	end
end
)
