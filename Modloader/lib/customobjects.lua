-- Lib Custom Objects --
local customobjects = {}

ENUM.OBJECTS = {
    UNITTYPE = {
        OBJECT = "object",
        TEXT = "text"
    },
    TILING = {
        STATIC = -1,
        DIRECTIONAL = 0,
        ANIMATED = 4,
        ANIMATEDDIRECTIONAL = 3,
        CHARACTER = 2,
        TILED = 1
    },
    TYPE = {
        OBJECT = 0,
        VERB = 1,
        PROPERTY = 2,
        PREFIX = 3,
        NOT = 4,
        LETTERS = 5,
        AND = 6,
        INFIX = 7
    }
}

-- OBJECT FORMAT --
--[[
    name: string                        -- The object's name.
                                           This appears in the rules list in the pause menu.
                                           Text objects' names are prefixed with "text_".
    
    unittype: string                    -- Whether this object is a regular object or a text object.
        "object"
        "text"

    tags: {string, string, ...}         -- The object's tags that are used in object searches.
  
    tiling: number                      -- Animation style (how the object's sprites are used).
        -1                                 None; static appearance      (Flag)
        0                                  Directional                  (Ghost)
        4                                  Animated per turn            (Bat)
        3                                  Animated & directional       (Belt)
        2                                  Character                    (Baba)
        1                                  Tiled                        (Wall)

    type: number                        -- The kind of text this object is.
                                           (For regular objects, type may be 0.)
        0                                  Objects
        1                                  Verbs
        2                                  Properties/Qualities
        3                                  Prefix conditions
        4                                  The word "not"
        5                                  Letters
        6                                  The word "and"
        7                                  Infix condition with parameters

    layer: number                       -- Change the order the sprites are rendered.
                                           Larger values are further in front.
                                           For text, layer should probably be 20.

    colour: {number, number}            -- The object's color as a coordinate on the color pallete.
                                           Check Data/Palletes to see the game's color palletes.
                                           {0, 0} is the top left, while {6, 4} is the bottom right.
                                           For text, this is the standard faded-out color.

    colour_active: {number, number}     -- The lit-up color that text uses when it's in a valid
                                            sentence.

    sprite_in_root: bool                -- Where the object's sprites are found.
                                           You should put your object sprites in your levelpack
                                            folder and set this to false.
        true                               Data/Sprites
        false                              Data/Worlds/[your levelpack folder]/Sprites
--]]

-- FUNCTIONALITY --

--[[
addtile({
	name = "badbad",
	unittype = "object",
	tags = {"animal","common"},
	tiling = 2,
	type = 0,
	layer = 17,
	colour = {4, 4},
	sprite_in_root = false,
})
--]]
function customobjects.addtile(tile)
    -- Add custom objects to the order in the object list
    table.insert(editor_objlist_order, tile.name)
    -- Add custom objects to the object list
    editor_objlist[i] = tile

    formatobjlist()
end

--[[
addtiles({
	{
		name = "badbad",
		unittype = ENUM.OBJECTS.UNITTYPE.OBJECT,
		tags = {"animal","common"},
		tiling = ENUM.OBJECTS.TILING.CHARACTER,
		type = ENUM.OBJECTS.TYPE.OBJECT,
		layer = 17,
		colour = {4, 4},
		sprite_in_root = false,
	},
	{
		name = "text_badbad",
		unittype = ENUM.OBJECTS.UNITTYPE.TEXT,
		tags = {"text","animal","common"},
		tiling = ENUM.OBJECTS.TILING.STATIC,
		type = ENUM.OBJECTS.TYPE.OBJECT,
		layer = 20,
		colour = {4, 3},
		colour_active = {4, 4},
		sprite_in_root = false,
	}
},
{
	"badbad",
	"text_badbad",
})
--]]
function customobjects.addtiles(tiles, tileorder)
    -- Assert tile order is formatted correctly
    for _, tile in ipairs(tiles) do
        -- Ensure object exists in tile order
        local contains = false
        for _, tilename in ipairs(tileorder) do
            contains = contains or tile.name == tilename
        end
        assert(contains, "Missing object from tile order: " .. tile.name)
    end

    local previndex = {}
    for _, tilename in ipairs(tileorder) do
        -- Ensure object exists in tiles
        local contains = false
        for _, tile in ipairs(tiles) do
            contains = contains or tilename == tile.name
        end
        assert(contains, "Nonexistent object in tile order: " .. tilename)

        -- Ensure no duplicates
        local nodupes = (previndex[tilename] == nil)
        previndex[tilename] = true
        assert(nodupes, "Duplicate object in tile order: " .. tilename)
    end

    -- Add custom objects to the order in the object list
    for _, tilename in ipairs(tileorder) do
        table.insert(editor_objlist_order, tilename)
    end

    -- Add custom objects to the object list
    for i, tile in ipairs(tiles) do
        editor_objlist[i] = tile
    end

    formatobjlist()
end

return customobjects