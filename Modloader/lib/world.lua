local Array, Object = module.use({"lib.array", "class.unit.unit"})
local world = {}

function world.getTilesOnPosition(x, y)
	local result = Array()

	local tileid = x + y * roomsizex

	if (unitmap[tileid] ~= nil) then
		for i, unitid in ipairs(unitmap[tileid]) do
			result:push(Object(units[unitid]))
		end
	end

	--[[
	local exclude = exclude_ or 0
	local fpaths = fpaths_ or false

	if fpaths then
		local pathshere = MF_findpaths(x,y)
		
		if (#pathshere > 0) then
			for i,v in ipairs(pathshere) do
				table.insert(result, v)
			end
		end
	end
	--]]

	return result
end

return world