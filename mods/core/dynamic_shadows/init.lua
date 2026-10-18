local S = core.get_translator('enable_shadows')
local storage = core.get_mod_storage()

local intensity = tonumber(core.settings:get("enable_shadows_intensity") or 0.33)
local intensity = tonumber(storage:get("intensity") or intensity)

core.register_on_joinplayer(function(player)
	player:set_lighting({
		shadows = { intensity = intensity }
	})
end)