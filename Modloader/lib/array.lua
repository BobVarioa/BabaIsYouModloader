local class = module.use("lib.class")
local Array = class()

function Array:init(...)
    -- The internal data of the array
    self._data = {...}
    -- The length of the array
    self.length = #self._data
end

-- My arrays will start at zero, dammit!
function Array:read(index)
    return self._data[index + 1]
end

-- index = number, value = any
function Array:write(index, value)
    self._data[index + 1] = value
    self.length = #self._data
    return value
end

-- Example: 
-- local myArr = Array(1,2,3)
--
-- myArr:forEach(function (value, index) 
--	print(value) -- 1, 2, 3
-- end)
function Array:forEach(func)
    for i = 0, self.length - 1, 1 do
        func(self:read(i), i)
    end
end

function Array:map(func)
    local arr = Array()
    for i = 0, self.length - 1, 1 do
        arr:write(i, func(self:read(i), i))
    end
    return arr
end

function Array:filter(func)
    local arr = Array()
    for i = 0, self.length - 1, 1 do
        local value = self:read(i)
        local temp = func(value, i)
        if temp then
            arr:push(value)
        end
    end
    return arr
end

function Array:push(...)
    for i, v in ipairs({...}) do
        self:write(self.length, v)
    end
end

function Array:toString()
    local temp = "[ "
    self:forEach(function(v, i)
        if i == 0 then
            temp = temp .. utils.stringify(v)
        else
            temp = temp .. ", " .. utils.stringify(v)
        end
    end)
    return temp .. " ]"
end

function Array:iterate()
    local i = -1
    local n = self.length - 1
    return function()
        i = i + 1
        return i, self:read(i)
    end
end

function Array:unpack()
    return table.unpack(self._data)
end

return Array