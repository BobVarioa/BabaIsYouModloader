local class = module.use({"lib.class"})
local Object = class()
Object:set {
	-- readonly
	name = {
		get = function () 
			return self._obj.strings[NAME]
		end
	},
	-- readonly
	unittype = {
		get = function () 
			return self._obj.strings[UNITTYPE]
		end
	},
	-- readonly
	unitname = {
		get = function () 
			return self._obj.strings[UNITNAME]
		end
	},
	-- readonly
	u_levelfile = {
		get = function () 
			return self._obj.strings[U_LEVELFILE]
		end
	},
	-- readonly
	u_levelname = {
		get = function () 
			return self._obj.strings[U_LEVELNAME]
		end
	},
	-- readonly
	shadereffects = {
		get = function () 
			return self._obj.strings[SHADEREFFECTS]
		end
	},
	-- readonly
	unitsigntext = {
		get = function () 
			return self._obj.strings[UNITSIGNTEXT]
		end
	},
	-- readonly
	decor = {
		get = function () 
			return self._obj.strings[DECOR]
		end
	},
	-- readonly
	clearcolour = {
		get = function () 
			return self._obj.strings[CLEARCOLOUR]
		end
	},
	-- readonly
	colour = {
		get = function () 
			return self._obj.strings[COLOUR]
		end
	},

	wobble = {
		get = function() 
			return self._obj.flags[WOBBLE]
		end,
		set = function (v)
			self._obj.flags[WOBBLE] = v
		end,
	},
	outline = {
		get = function() 
			return self._obj.flags[OUTLINE]
		end,
		set = function (v)
			self._obj.flags[OUTLINE] = v
		end,
	},
	maplevel = {
		get = function() 
			return self._obj.flags[MAPLEVEL]
		end,
		set = function (v)
			self._obj.flags[MAPLEVEL] = v
		end,
	},
	dead = {
		get = function() 
			return self._obj.flags[DEAD]
		end,
		set = function (v)
			self._obj.flags[DEAD] = v
		end,
	},
	infront = {
		get = function() 
			return self._obj.flags[INFRONT]
		end,
		set = function (v)
			self._obj.flags[INFRONT] = v
		end,
	},
	converted = {
		get = function() 
			return self._obj.flags[CONVERTED]
		end,
		set = function (v)
			self._obj.flags[CONVERTED] = v
		end,
	},
	phantom = {
		get = function() 
			return self._obj.flags[PHANTOM]
		end,
		set = function (v)
			self._obj.flags[PHANTOM] = v
		end,
	},
	level_justconverted = {
		get = function() 
			return self._obj.flags[LEVEL_JUSTCONVERTED]
		end,
		set = function (v)
			self._obj.flags[LEVEL_JUSTCONVERTED] = v
		end,
	},
	visioneffect = {
		get = function() 
			return self._obj.flags[VISIONEFFECT]
		end,
		set = function (v)
			self._obj.flags[VISIONEFFECT] = v
		end,
	},
	vision_optimize = {
		get = function() 
			return self._obj.flags[VISION_OPTIMIZE]
		end,
		set = function (v)
			self._obj.flags[VISION_OPTIMIZE] = v
		end,
	},
	vision_centered = {
		get = function() 
			return self._obj.flags[VISION_CENTERED]
		end,
		set = function (v)
			self._obj.flags[VISION_CENTERED] = v
		end,
	},
}

function Object:init(obj)
	self._obj = obj
end

return Object