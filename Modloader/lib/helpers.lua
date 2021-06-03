local helpers = {}

function helpers.copyTable(table, destination)
	local table = table or {}
	local result = destination or {}

	for k, v in pairs(table) do
		if not result[k] then
			if type(v) == "table" and k ~= "__index" and k ~= "__newindex" then
				result[k] = helpers.copyTable(v)
			else
				result[k] = v
			end
		end
	end

	return result
end

return helpers