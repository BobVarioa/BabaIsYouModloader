local RuleCollection = class()

function RuleCollection:init()
	self.builder = RuleBuilder()
end

--[[
BABA IS YOU
HAS
BABA
--]]

-- RuleCollection:seek(x, y, options)
-- should continue parsing in the direction(s) specified by it's parse direction
function RuleCollection:seek(x, y, opts, dir)
    -- look in circle around this tile, if it's text repeat, etc.

	local word

    -- parsing magic

    if opts.recursive then
        if dir then
			local jumptable = {
				[ENUM.Parser.Direction.UpLeft] = function()
					return x - 1, y + 1
				end,
				[ENUM.Parser.Direction.Up] = function()
					return x, y + 1
				end,
				[ENUM.Parser.Direction.UpRight] = function()
					return x + 1, y + 1
				end,
		
				[ENUM.Parser.Direction.Left] = function()
					return x - 1, y
				end,
				[ENUM.Parser.Direction.Center] = function()
					return x, y
				end,
				[ENUM.Parser.Direction.Right] = function()
					return x + 1, y
				end,
		
				[ENUM.Parser.Direction.DownLeft] = function()
					return x - 1, y - 1
				end,
				[ENUM.Parser.Direction.Down] = function()
					return x, y - 1
				end,
				[ENUM.Parser.Direction.DownRight] = function()
					return x + 1, y - 1
				end
			}
			RuleCollection:seek(jumptable[dir](), opts, word:getParseDirection(dir))
        else
			local jumptable = {
				[ENUM.Parser.Directions.Normal] = function ()
					RuleCollection:seek(x + 1, y, opts, ENUM.Parser.Direction.Right)
					RuleCollection:seek(x, y - 1, opts, ENUM.Parser.Direction.Down)
				end
			} 
			jumptable[opts.directions]()
        end
        
    end
end

return RuleCollection