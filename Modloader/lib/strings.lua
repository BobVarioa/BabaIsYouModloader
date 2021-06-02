local strings = {}

function strings.split(inputstr, sep)
	local t = {}
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(t, str)
	end
	return t
end
function strings.join(arr, sep)
	local t = ""
	for i, v in ipairs(arr) do
		if i == 1 then
			t = t .. v
		else
			t = t .. sep .. v
		end
	end
	return t
end
function strings.stringify(value)
	if type(value) == "table" and type(value.toString) == "function" then
		return value:toString()
	elseif type(value) == "table" then
		local temp = "{ "
		local i = 0
		for k, v in pairs(value) do
			if i == 0 then
				temp = temp .. strings.stringify(k) .. " = " .. strings.stringify(v)
			else
				temp = temp .. ", " .. strings.stringify(k) .. " = " .. strings.stringify(v)
			end
			i = i + 1
		end
		return temp .. " }"
	elseif type(value) == "string" then
		return "\"" .. value .. "\""
	elseif type(value) == "nil" then
		return "nil"
	elseif type(value) == "function" then
		return "function (...) end"
	else
		return tostring(value)
	end
end
function strings.find(string, pattern)
	local _, _, _string = string.find(string, pattern)
	return _string or string
end

return strings