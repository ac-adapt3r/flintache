local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

--      NODES       --

-- planks
core.register_node(mod_name..":planks", {
    description = S("Planks"),
    is_ground_content = false,
    groups = {solid = 1, suffocates = 0, choppy = 1},
    tiles = { "planks.png" },
    sounds = soundlib.wood(),
})

-- sandstone bricks
core.register_node(mod_name..":sandstone_bricks", {
    description = S("Sandstone Bricks"),
    is_ground_content = false,
    groups = {solid = 1, suffocates = 0, cracky = 2},
    tiles = { "sandstone_bricks.png" },
    sounds = soundlib.stone(),
})

-- rope
core.register_node(mod_name..":rope", {
    description = S("Rope"),
    is_ground_content = false,
    groups = {solid = 1, suffocates = 0, oddly_breakable_by_hand = 2, attached_node = 4, },
    climbable = true,
    walkable = true,
    move_resistance = 2,

    tiles = { "rope.png", },
    drawtype = "nodebox",
    paramtype = "light",
    sunlight_propagates = true,
    node_box = {
		type = "fixed",
		fixed = {-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625},
	},
    selection_box = {
		type = "fixed",
		fixed = {-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625},
	},
    
    inventory_image = "rope_inventory.png",
    wield_image = "rope_inventory.png",

    sounds = soundlib.leaves(),
    on_place = function(itemstack, placer, pointed_thing)
        local under = pointed_thing.under
        local node = core.get_node(under)
        local bottom_pos = vector.subtract(under, {x=0,y=1,z=0})
        local bottom_node = core.registered_nodes[core.get_node(bottom_pos).name]

        if node.name == mod_name..":rope" and (bottom_node.name == "air" or bottom_node.buildable_to == true) then
            core.set_node(bottom_pos, {name=mod_name..":rope"})
            itemstack:take_item()
            return itemstack
        end

        core.item_place(itemstack, placer, pointed_thing)
        return itemstack
    end,
})

--------====== CARVINGS ======--------
local basecarving = {
    description = S("Heart carving"),
    drawtype = "nodebox",
    node_box = {
		type = "fixed",
		fixed = {-0.5, -0.499, -0.5, 0.5, -0.5, 0.5},
	},
    selection_box = {
		type = "fixed",
		fixed = {-0.125, -0.499, -0.125, 0.125, -0.5, 0.125},
	},
    paramtype = "light",
    paramtype2 = "wallmounted",
    is_ground_content = false,
    walkable = false,
    buildable_to = true,
    groups = {solid = 0, suffocates = 0, attached_node=1, oddly_breakable_by_hand = 1, carving = 1, instant = 1, },
    tiles = {"carving_heart.png"},
    sounds = {},
    drop = {},
    use_texture_alpha = "blend",
}

core.register_node(mod_name..":carving_0", basecarving)

local uniquenames = {
    "Circle", "Right arrow", "Left arrow", "Up arrow", "Down arrow", "Exclamation mark", "Question mark", "Eye", "Smile", 
}

-- Loop and register
for i, name in ipairs(uniquenames) do
    -- Create a *new* table for each node to avoid conflicts.
    local texturename = string.gsub(string.lower(name), " ", "_")
    local node_def = {
        description = name.." carving",
        tiles = {"carving_" .. texturename .. ".png"},
    }
    -- Merge the base definition into the new node definition
    -- (This ensures properties *not* specified in node_def get the base value)
    local final_def = table.copy(basecarving)
    for k, v in pairs(node_def) do
        final_def[k] = v
    end

    core.register_node(mod_name..":carving_" .. i, final_def)
end