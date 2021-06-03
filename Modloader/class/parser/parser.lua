local WordRegistry, class, Array, world = module.use({"class.word.wordregistry", "lib.class", "lib.array", "lib.world"})

ENUM.Parser = {
    Direction = {
        UpLeft = 1,
        Up = 2,
        UpRight = 3,
        Left = 4,
        -- Unused
        Center = 5,
        Right = 6,
        DownLeft = 7,
        Down = 8,
        DownRight = 9
    },
    Directions = {
		Normal = 1, -- Down, Right
        Cardinal = 2,
        Orthogonal = 3
    }
}

local Parser = class()

function Parser:init(options)
    self.directions = options.directions or ENUM.Parser.Directions.Normal
end

function Parser:getRulesFromTile(x, y, tile)
    local first = WordRegistry:get(tile.unitname)

    -- partial is an RuleCollection or nil
    local partial = first:parse(x, y, {
        first = true,
    })

    if partial then
        partial:seek(x, y, {
            recursive = true,
        })
    end

    return partial
end

-- Finds texts in level and generates an ast 
function Parser:parse()
    local finalRules = Array()

    for x = 1, roomsizex, 1 do
        for y = 1, roomsizey, 1 do
            local tiles = world.getTilesOnPosition(x, y):filter(function(tile, _)
                return (tile.unittype == "text")
            end)
            for i, tile in tiles:iterate() do
                if tile.checked then
                    break
                end

                -- RuleCollection or Array
                local rules = self:getRulesFromTile(x, y, tile) or Array()
                finalRules:push(rules:unpack())
                tile.checked = true
            end
        end
    end

    return {
        type = "base",
        rules = finalRules
    }
end

-- Run a given ast 
function Parser:run(ast)
    --[[
	Separate into logical operations based off separations 
		not baba 
			not idle
			lonely
			facing 
				me 
				not up
			not on 
				keke
			feeling
				not push 
		is 
			not not not baba -> not baba (this step normalizes the nots )
			you 
		play 
			A#
		not follow 
			keke

	Test conditions :
		is there a not baba?
			is it not idle?
			is it lonely?
			is it facing not up? 
			is it feeling not push?
			is it not on keke? 
			is it facing a me?
			(rank these based on complexity of operations)
		then 
			give this object the you property 
			play A# 
			negate any instances of "follow keke" assigned to this object
	--]]

end
