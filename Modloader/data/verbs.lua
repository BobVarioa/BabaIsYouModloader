local Verb = module.use({"class.word.verb"})

Verb("follow", {
	name = "text_follow",
	sprite = "text_follow",
	sprite_in_root = true,
	unittype = "text",
	tiling = -1,
	type = 1,
	colour = {5, 0},
	active = {5, 2},
	tile = {8, 0},
	grid = {10, 5},
	layer = 20,
})