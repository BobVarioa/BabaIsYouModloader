local i = 0
return {
    name = "Test Mod",
    init = function()
        table.insert(mod_hook_functions["level_start"], function()
            timedmessage("Test Mod Loaded " .. i .. " times!")
			print("hi")
        end)
		i = i + 1
    end,
}
