local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

-- spikes in hidden state
core.register_node("traps:spike_trap_hidden", {
    description = S("Spike Trap"),
    drawtype = "nodebox",
    paramtype = "light",
    sunlight_propagates = true,
    is_ground_content = false,
    groups = {solid = 0, suffocates = 0, oddly_breakable_by_hand = 2, attached_node = 1},
    tiles = { "holes.png" },
    sounds = {},
    walkable     = false,
    wield_image = "spikes.png",
    inventory_image = "spikes.png",
    node_box = {
		type = "fixed",
		fixed = {-0.5, -0.45, -0.5, 0.5, -0.5, 0.5},
	},
    selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.4, -0.5, 0.5, -0.5, 0.5},
	},
    use_texture_alpha = "blend",

    on_walk_over = function(pos, node, player)
        core.chat_send_player(player:get_player_name(), "Hey! Watch it!")
        core.set_node({x=pos.x, y=pos.y, z=pos.z}, {name = "traps:spike_trap_active"})
    end
})

-- spikes active
core.register_node("traps:spike_trap_active", {
    description = S("Active Spike Trap"),
    paramtype = "light",
    sunlight_propagates = true,
    is_ground_content = false,
    walkable = false,
    drawtype = "plantlike",
    groups = {solid = 0, suffocates = 0, oddly_breakable_by_hand = 3, choppy = 2},
    tiles = { "spikes.png" },
    sounds = {},
    drop = "traps:spike_trap_hidden",
    damage_per_second = 2,

    on_walk_over_end = function (pos, node, player)
        core.set_node({x=pos.x, y=pos.y, z=pos.z}, {name = "traps:spike_trap_hidden"})
    end
})