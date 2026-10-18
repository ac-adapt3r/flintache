local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

local plants = {}

-- LEAVES
core.register_node(mod_name..":leaves", {
    description = S("Leaves"),
    drawtype = "allfaces_optional",
    paramtype = "light",
    sunlight_propagates = true,
    is_ground_content = false,
    --climbable = true,
    --liquid_move_physics = true,
    walkable = false,
    move_resistance = 2,
    --liquid_viscosity = 10,
    groups = {solid = 0, suffocates = 0, snappy = 2, shearsy = 1, tree_chop = 1, },
    tiles = { "leaves.png" },
    --special_tiles = {"leaves_simple.png"},
    sounds = soundlib.leaves(),
    drop = {
        max_items = 1,
        items = {
            {items = {mod_name..":stick"}, rarity = 5}
        },
    },
    waving = 1,
})

-- SPARSE LEAVES
core.register_node(mod_name..":sparse_leaves", {
    description = S("Sparse leaves"),
    drawtype = "mesh",
    mesh = "sparse_leaves.obj",
    use_texture_alpha = "clip",
    paramtype = "light",
    sunlight_propagates = true,
    is_ground_content = false,
    climbable = false,
    walkable = false,
    move_resistance = 1,
    groups = {solid = 0, suffocates = 0, snappy = 2, shearsy = 1, tree_chop = 1, },
    tiles = { "sparse_leaves.png" },
    sounds = soundlib.leaves(),
    drop = {
        max_items = 1,
        items = {
            {items = {mod_name..":stick"}, rarity = 5}
        },
    },
    waving = 2,
    selection_box = {
        type = "fixed",
        fixed = {0.4, 0.4, 0.4, -0.4, -0.4, -0.4}
    }
})

-- SMALL BUSH
core.register_node(mod_name..":small_bush", {
    description = S("Small bush"),
    drawtype = "mesh",
    mesh = "small_bush.obj",
    use_texture_alpha = "clip",
    paramtype = "light",
    sunlight_propagates = true,
    is_ground_content = false,
    climbable = false,
    walkable = false,
    move_resistance = 2,
    groups = {solid = 0, suffocates = 0, snappy = 3, shearsy = 1, tree_chop = 1, attached_node = 1, },
    tiles = { "small_bush.png" },
    sounds = soundlib.leaves(),
    drop = mod_name..":stick 2",
    waving = 1,
})

-- TREE LOG
core.register_node(mod_name..":tree_log", {
    description = S("Tree log"),
    paramtype2 = "facedir",
    is_ground_content = false,
    groups = {solid = 1, suffocates = 0, choppy = 1, strippable = 1, carvable = 1, oak_log = 1, tree_log = 1, tree_chop = 1, },

    strip_node = mod_name..":stripped_tree_log",
    strip_drop = "miscitems:wood_fibers",

    tiles = {"tree_trunk.png", "tree_trunk.png", "tree_bark.png", "tree_bark.png", "tree_bark.png", "tree_bark.png",},
    sounds = soundlib.wood(),
    on_place = core.rotate_node,
})
-- TREE ROOT FLARE
core.register_node(mod_name..":tree_root_flare", {
    description = S("Tree root flare"),
    drawtype = "nodebox",
    paramtype = "light",
    sunlight_propagates = true,
    paramtype2 = "4dir",
    is_ground_content = false,
    groups = {suffocates = 0, choppy = 5, oak_log = 1, tree_log = 1, },

    node_box = {
        type = "fixed",
        fixed = {
            0.3125, 0, 0.5,
            -0.3125, -0.5, 0.125
        }
    },

    tiles = {"tree_bark.png"},
    sounds = soundlib.wood(),
    on_place = core.rotate_node,
})

-- TREE STUMP
core.register_node(mod_name..":tree_stump", {
    description = S("Tree log"),
    paramtype2 = "facedir",
    is_ground_content = false,
    groups = {solid = 1, suffocates = 0, choppy = 5, oak_log = 1, tree_log = 1, hard = 1, },

    tiles = {"tree_trunk.png", "tree_trunk.png", "tree_stump.png", "tree_stump.png", "tree_stump.png", "tree_stump.png",},
    sounds = soundlib.wood(),
    on_place = core.rotate_node,
})

-- STRIPPED TREE LOG
core.register_node(mod_name..":stripped_tree_log", {
    description = S("Stripped tree log"),
    paramtype2 = "facedir",
    is_ground_content = false,
    groups = {solid = 1, suffocates = 0, choppy = 1, oak_log = 1, chopstages = 1, tree_log = 1, tree_chop = 1,  },
    tiles = {"stripped_tree_trunk.png", "stripped_tree_trunk.png", "stripped_wood.png", "stripped_wood.png", "stripped_wood.png", "stripped_wood.png",},
    sounds = soundlib.wood(),

    on_place = core.rotate_node,
    chop_node = mod_name..":cutlog_1",
})


-- HOLLOW
core.register_node(mod_name..":hollow", {
    description = S("Tree hollow"),
    paramtype2 = "facedir",
    is_ground_content = false,
    groups = {solid = 1, suffocates = 0, choppy = 1, oak_log = 1, tree_log = 1, tree_chop = 1, },

    tiles = {"tree_trunk.png", "tree_trunk.png", "tree_bark.png", "tree_bark.png", "tree_bark.png", "tree_hollow.png",},
    sounds = soundlib.wood(),

    on_place = core.rotate_node,

    drop = {},
})

-- RESINOUS HOLLOW
core.register_node(mod_name..":hollow_resinous", {
    description = S("Resinous hollow"),
    paramtype2 = "facedir",
    is_ground_content = false,
    groups = {solid = 1, suffocates = 0, choppy = 1, oak_log = 1, tree_log = 1, },

    tiles = {"tree_trunk.png", "tree_trunk.png", "tree_bark.png", "tree_bark.png", "tree_bark.png", "tree_hollow_resinous.png",},
    sounds = soundlib.wood(),

    on_place = core.rotate_node,
    on_punch = function (pos, node, puncher, pointed_thing)
        core.set_node(pos, {name=mod_name..":hollow", param2=node.param2})

        local stack = ItemStack("miscitems:resin")
        local dir = core.facedir_to_dir(node.param2)
        local stackpos = vector.subtract(pos, dir)

        core.add_item(stackpos, stack)

        core.sound_play("hollow_pop", {
            pos = pos,
            pitch = 0.9,
            gain = 0.2,
            max_hear_distance = 8,
          })
    end,

    drop = {},
})







-- tree log chop stages --

local logstagesbase = {
    description = S("Cut log"),
    paramtype2 = "facedir",
    drawtype = "nodebox",
    node_box = {
		type = "fixed",
		fixed = {-0.5, 0.5, -0.5, 0.5, -0.5, 0.5},
	},
    selection_box = {
		type = "fixed",
		fixed = {-0.5, 0.5, -0.5, 0.5, -0.5, 0.5},
	},
    is_ground_content = false,
    groups = {solid = 0, suffocates = 0, choppy = 1, oak_log = 1, chopstages = 1, tree_log = 1, },
    paramtype = "light",
    sunlight_propagates = true,
    tiles = {"stripped_tree_trunk.png", "stripped_tree_trunk.png", "stripped_wood.png", "stripped_wood.png", "stripped_wood.png", "stripped_wood.png",},
    sounds = soundlib.wood(),
    on_place = core.rotate_node,
    drop = mod_name..":stripped_tree_log",
}

for i = 1, 3, 1 do
    local ii =0.125 * i
    local nodebox = {
		type = "fixed",
		fixed = {-0.5+ii, 0.5, -0.5+ii, 0.5-ii, -0.5, 0.5-ii},
	}

    local newdef = {
        description = "Cut log "..i,
        node_box = nodebox,
        selection_box = nodebox,
    }

    local final_def = table.copy(logstagesbase)
    for k, v in pairs(newdef) do
        final_def[k] = v
    end
    core.register_node(mod_name..":cutlog_"..i, final_def)
end





-- GRASS
core.register_node(mod_name..":grass_1", {
    description = S("Grass"),
    drawtype = "plantlike",
    paramtype2 = "meshoptions",
    param2 = 4 + 0x08,
    place_param2 = 4 + 0x08,
    paramtype = "light",
    sunlight_propagates = true,
    is_ground_content = false,
    groups = {solid = 0, suffocates = 0, oddly_breakable_by_hand = 2, snappy = 1, attached_node = 1, shearsy = 1, grass = 1, },
    tiles = { "tallgrass.1.png" },
    waving = 1,
    walkable     = false,
    buildable_to = true,
    wield_image = "grass_inventory.png",
    inventory_image = "grass_inventory.png",
    drop = {},
    floodable = true,
    selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},
    sounds = soundlib.leaves({footstep={}}),

    on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack(mod_name..":grass_" .. math.random(1,3))
		local ret = core.item_place(stack, placer, pointed_thing)
		return ItemStack(mod_name..":grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,

    --[[on_construct = function (pos)
        core.swap_node({x=pos[1], y=pos[2], z=pos[3]}, {name=mod_name..":grass_"..math.random(1, 3)})
    end,]]
})
-- grass variants
for i = 2, 3, 1 do
    core.register_node(mod_name..":grass_"..i, {
        description = S("Grass"),
        drawtype = "plantlike",
        paramtype2 = "meshoptions",
        place_param2 = 4 + 0x08,
        paramtype = "light",
        sunlight_propagates = true,
        is_ground_content = false,
        groups = {solid = 0, suffocates = 0, oddly_breakable_by_hand = 2, snappy = 1, attached_node = 1, shearsy = 1, },
        tiles = { "tallgrass."..i..".png" },
        waving = 1,
        walkable     = false,
        buildable_to = true,
        shearsy_drop = mod_name..":grass_1",
        drop = {},
        floodable = true,
        selection_box = {
            type = "fixed",
            fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
        },
        sounds = soundlib.leaves({footstep={}})
    }) 
end

core.register_lbm({
    label = "Upgrade old grass",
    -- Descriptive label for profiling purposes (optional).
    -- Definitions with identical labels will be listed as one.

    name = "plants:replace_old_grass",
    -- Identifier of the LBM, should follow the modname:<whatever> convention

    nodenames = {"plants:grass_1", "plants:grass_2", "plants:grass_3", },
    -- List of node names to trigger the LBM on.
    -- Names of non-registered nodes and groups (as group:groupname)
    -- will work as well.

    run_at_every_load = false,
    -- If `false`: The LBM only runs on mapblocks the first time they are
    -- activated after the LBM was introduced.
    -- It never runs on mapblocks generated after the LBM's introduction.
    -- See above for details.
    --
    -- If `true`: The LBM runs every time a mapblock is activated.

    action = function(pos, node, dtime_s)
        core.swap_node(pos, {name=node.name, param2 = 4 + 0x08})
    end,
    -- Function triggered for each qualifying node.
    -- `dtime_s` is the in-game time (in seconds) elapsed since the mapblock
    -- was last active (available since 5.7.0).
})

-- FERN
core.register_node(mod_name..":fern", {
    description = S("Fern"),
    drawtype = "plantlike",
    paramtype = "light",
    sunlight_propagates = true,
    is_ground_content = false,
    groups = {solid = 0, suffocates = 0, oddly_breakable_by_hand = 2, snappy = 1, attached_node = 1, shearsy = 1,},
    tiles = { "fern.png" },
    waving = 1,
    walkable     = false,
    buildable_to = true,
    wield_image = "fern.png",
    inventory_image = "fern.png",
    drop = {},
    floodable = true,
    node_box = {
		type = "fixed",
		fixed = {1, -0.5, 1, 1, -0.25, 1},
    },
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
	},
    sounds = soundlib.leaves({footstep={}})
})

-- BLUEBERRY BUSH
core.register_node(mod_name..":blueberry_bush", {
    description = S("Blueberry bush"),
    drawtype = "plantlike",
    paramtype = "light",
    sunlight_propagates = true,
    is_ground_content = false,
    groups = {solid = 0, suffocates = 0, oddly_breakable_by_hand = 2, snappy = 1, attached_node = 1, shearsy = 1,},
    tiles = { "blueberry_bush.png" },
    waving = 1,
    walkable     = false,
    buildable_to = true,
    wield_image = "blueberry_bush.png",
    inventory_image = "blueberry_bush.png",
    drop = {},
    selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},
    sounds = soundlib.leaves({footstep={}}),

    on_punch = function (pos, node, puncher, pointed_thing)
        
    end
})

----------============ FLOWERS =============-------------

core.register_node(mod_name..":starflower", {
    description = S("Starflower"),
    drawtype = "plantlike",
    paramtype = "light",
    sunlight_propagates = true,
    is_ground_content = false,
    light_source = 2,
    groups = {solid = 0, suffocates = 0, oddly_breakable_by_hand = 2, snappy = 1, attached_node = 1, shearsy = 1, },
    tiles = { "starflower.png" },
    waving = 1,
    walkable     = false,
    buildable_to = false,
    floodable = true,
    drop = {},
    inventory_image = "starflower.png",
    selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},
    sounds = soundlib.leaves({footstep={}}),
})

core.register_node(mod_name..":daydreamer", {
    description = S("Daydreamer"),
    drawtype = "plantlike",
    paramtype = "light",
    sunlight_propagates = true,
    is_ground_content = false,
    groups = {solid = 0, suffocates = 0, oddly_breakable_by_hand = 2, snappy = 1, attached_node = 1, shearsy = 1, },
    tiles = { "daydreamer.png" },
    waving = 1,
    walkable     = false,
    buildable_to = false,
    floodable = true,
    drop = {},
    inventory_image = "daydreamer.png",
    selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},
    sounds = soundlib.leaves({footstep={}}),
})

core.register_node(mod_name..":heartkeeper", {
    description = S("Heartkeeper"),
    drawtype = "plantlike",
    paramtype = "light",
    sunlight_propagates = true,
    light_source = 1,
    is_ground_content = false,
    groups = {solid = 0, suffocates = 0, oddly_breakable_by_hand = 2, snappy = 1, attached_node = 1, shearsy = 1, },
    tiles = {{
        name = "heartkeeper_animated.png", -- Your texture file
        animation = {
          type = "vertical_frames",       -- Stacked vertically
          aspect_w = 16,                  -- Width of one frame
          aspect_h = 16,                  -- Height of one frame (e.g., 16x16)
          length = 4,                   -- Duration per frame (seconds)
          -- For smoother blending, use multiple frames in a tall image
          -- length = 0.05, -- Faster animation
        }
      }},
    waving = 1,
    walkable     = false,
    buildable_to = false,
    floodable = true,
    inventory_image = "heartkeeper.png",
    wield_image = "heartkeeper.png",
    drop = {},
    selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},
    sounds = soundlib.leaves({footstep={}}),

    preserve_metadata = function(pos, oldnode, oldmeta, drops)
        local meta = drops[1]:get_meta()
        meta:set_int("healenergy", oldmeta.healenergy or 10)
    end,

    after_place_node = function(pos, placer, itemstack, pointed_thing)
        local meta = core.get_meta(pos)
        local itemstack_meta = itemstack:get_meta()
        local previous_energy = itemstack_meta:contains("healenergy") and itemstack_meta:get_int("healenergy")
        meta:set_int("healenergy", previous_energy or 10)
    end,
})

core.register_node(mod_name..":withered_heartkeeper", {
    description = S("Withered Heartkeeper"),
    drawtype = "plantlike",
    paramtype = "light",
    sunlight_propagates = true,
    is_ground_content = false,
    groups = {solid = 0, suffocates = 0, oddly_breakable_by_hand = 2, snappy = 1, attached_node = 1, shearsy = 1, },
    tiles = {"withered_heartkeeper.png"},
    inventory_image = "withered_heartkeeper.png",
    waving = 1,
    walkable     = false,
    buildable_to = false,
    floodable = true,
    drop = {},
    selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},
    sounds = soundlib.leaves({footstep={}}),
})


core.register_node(mod_name..":clovers", {
    description = S("Clovers"),
    drawtype = "nodebox",
    paramtype = "light",
    sunlight_propagates = true,
    is_ground_content = false,
    waving = 2,
    groups = {solid = 0, suffocates = 0, oddly_breakable_by_hand = 2, snappy = 1, attached_node = 1, shearsy = 1, },
    tiles = { "clovers.png", "clovers.png", "nothing.png", "nothing.png", "nothing.png", "nothing.png", },
    sounds = soundlib.leaves({footstep={}}),
    use_texture_alpha = "blend",
    inventory_image = "clovers.png",
    wield_image = "clovers.png",
    --wield_scale = {x=1, y=0.4, z=1},
    walkable = false,
    buildable_to = true,
    floodable = true,
    drop = {},
    node_box = {
		type = "fixed",
		fixed = {-0.5, -0.4, -0.5, 0.5, -0.5, 0.5},
	},
})

core.register_node(mod_name..":clovers_flowering", {
    description = S("Flowering clovers"),
    drawtype = "nodebox",
    paramtype = "light",
    sunlight_propagates = true,
    is_ground_content = false,
    waving = 2,
    groups = {solid = 0, suffocates = 0, oddly_breakable_by_hand = 2, snappy = 1, attached_node = 1, shearsy = 1, },
    tiles = { "clovers_flowering.png", "clovers_flowering.png", "nothing.png", "nothing.png", "nothing.png", "nothing.png", },
    sounds = soundlib.leaves({footstep={}}),
    use_texture_alpha = "blend",
    inventory_image = "clovers_flowering.png",
    wield_image = "clovers_flowering.png",
    --wield_scale = {x=1, y=0.4, z=1},
    walkable = false,
    buildable_to = true,
    floodable = true,
    drop = {},
    node_box = {
		type = "fixed",
		fixed = {-0.5, -0.4, -0.5, 0.5, -0.5, 0.5},
	},
})

core.register_node(mod_name..":quiet_bangle", {
    description = S("Quiet Bangle"),
    drawtype = "plantlike",
    paramtype = "light",
    sunlight_propagates = true,
    is_ground_content = false,
    light_source = 1,
    groups = {solid = 0, suffocates = 0, oddly_breakable_by_hand = 4, snappy = 3, attached_node = 1, shearsy = 1, boomshearsy = 1 },
    boomDamage = 6,
    tiles = { "quiet_bangle.png" },
    waving = 1,
    walkable     = false,
    buildable_to = false,
    inventory_image = "quiet_bangle.png",
    drop = {},
    selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},
    sounds = soundlib.leaves({footstep={}}),
})




core.register_node(mod_name..":forest_flower_yellow", {
    description = S("Yellow forest flower"),
    drawtype = "mesh",
    mesh = "forest_flower.obj",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    is_ground_content = false,
    groups = {solid = 0, suffocates = 0, oddly_breakable_by_hand = 2, snappy = 1, attached_node = 1, shearsy = 1, },
    tiles = { "forest_flower_yellow.png" },
    sounds = soundlib.leaves({footstep={}}),
    --waving = 1, waving is disabled because its buggy as fuck
    walkable = false,
    drop = {},
    wield_image = "forest_flower_yellow_inventory.png",
    inventory_image = "forest_flower_yellow_inventory.png",
    node_box = {
		type = "fixed",
		fixed = {-0.5, -0.4375, -0.5, 0.5, -0.5, 0.5},
	},
    selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.4375, -0.5, 0.5, -0.5, 0.5},
	},
    use_texture_alpha = "blend",
})


core.register_node(mod_name..":moss", {
    description = S("Moss"),
    drawtype = "mesh",
    mesh = "moss.obj",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    is_ground_content = false,
    groups = {solid = 0, suffocates = 0, snappy = 1, attached_node = 1, instant = 1, },
    tiles = { "moss.png" },
    sounds = soundlib.grass({footstep={}}),
    walkable = false,
    wield_image = "moss_inventory.png",
    inventory_image = "moss_inventory.png",
    node_box = {
		type = "fixed",
		fixed = {-0.5, -0.4375, -0.5, 0.5, -0.5, 0.5},
	},
    selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.4375, -0.5, 0.5, -0.5, 0.5},
	},
    use_texture_alpha = "blend",
})

core.register_node(mod_name..":moss_flowery", {
    description = S("Flowery moss"),
    drawtype = "mesh",
    mesh = "moss.obj",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    is_ground_content = false,
    groups = {solid = 0, suffocates = 0, snappy = 1, attached_node = 1, instant = 1, },
    tiles = { "moss_flowery.png" },
    sounds = soundlib.grass({footstep={}}),
    walkable = false,
    wield_image = "moss_flowery_inventory.png",
    inventory_image = "moss_flowery_inventory.png",
    node_box = {
		type = "fixed",
		fixed = {-0.5, -0.4375, -0.5, 0.5, -0.5, 0.5},
	},
    selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.4375, -0.5, 0.5, -0.5, 0.5},
	},
    use_texture_alpha = "blend",
})

core.register_node(mod_name..":moss_sparse_flowery", {
    description = S("Sparse flowery moss"),
    drawtype = "mesh",
    mesh = "moss.obj",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    is_ground_content = false,
    groups = {solid = 0, suffocates = 0, snappy = 1, attached_node = 1, instant = 1, },
    tiles = { "moss_sparse_flowery.png" },
    sounds = soundlib.grass({footstep={}}),
    walkable = false,
    wield_image = "moss_sparse_flowery_inventory.png",
    inventory_image = "moss_sparse_flowery_inventory.png",
    node_box = {
		type = "fixed",
		fixed = {-0.5, -0.4375, -0.5, 0.5, -0.5, 0.5},
	},
    selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.4375, -0.5, 0.5, -0.5, 0.5},
	},
    use_texture_alpha = "blend",
})

core.register_node(mod_name..":moss_sparse", {
    description = S("Sparse moss"),
    drawtype = "mesh",
    mesh = "moss.obj",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    is_ground_content = false,
    groups = {solid = 0, suffocates = 0, snappy = 1, attached_node = 1, instant = 1, },
    tiles = { "moss_sparse.png" },
    sounds = soundlib.grass({footstep={}}),
    walkable = false,
    wield_image = "moss_sparse_inventory.png",
    inventory_image = "moss_sparse_inventory.png",
    selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.4375, -0.5, 0.5, -0.5, 0.5},
	},
    use_texture_alpha = "blend",
})

core.register_node(mod_name..":stick", {
    description = S("Stick"),
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "4dir",
    sunlight_propagates = true,
    is_ground_content = false,
    groups = {solid = 0, suffocates = 0, pickable = 1, attached_node = 1, stick = 1},
    tiles = { "stick.png" },
    sounds = {},
    walkable     = false,
    wield_image = "stick.png",
    inventory_image = "stick.png",
    node_box = {
		type = "fixed",
		fixed = {-0.5, -0.45, -0.5, 0.5, -0.5, 0.5},
	},
    selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.45, -0.5, 0.5, -0.5, 0.5},
	},
    use_texture_alpha = "blend",

    on_place = function (itemstack, placer, pointed_thing)
        local pos = pointed_thing.under
        local node = core.get_node(pos)
        local def = core.registered_nodes[node.name]
        if node.name == mod_name..":stick" then
            core.set_node(pos, {name="fire:sticks_pile"})
            itemstack:take_item()
        elseif def and def.groups.fuelable then
            local meta = core.get_meta(pos)
            local heat = meta:get_int("heat")
            local newheat = heat+5
            meta:set_int("heat", newheat)

            if def.on_fueled ~= nil then
                def.on_fueled(pos, node, placer, newheat)
            end

            itemstack:take_item()
        else
            core.rotate_node(itemstack, placer, pointed_thing)
        end

        return itemstack
    end,
})

core.register_node(mod_name..":twig", {
    description = S("Twig"),
    drawtype = "torchlike",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    is_ground_content = false,
    groups = {solid = 0, suffocates = 0, snappy = 3, attached_node = 1, stick = 1},
    tiles = { "twig.png" },
    sounds = soundlib.wood(),
    drop = mod_name..":stick",
    wield_image = "twig.png",
    inventory_image = "twig.png",
    node_box = {
        type = "fixed",
        fixed = {0, 0, 0, 0, 0, 0}
    },
    selection_box = {
		type = "wallmounted",
		wall_side = {-0.5, -0.2, -0.2, 0.5, 0.2, 0.2},
	},
    use_texture_alpha = "blend",
})

core.register_node(mod_name..":twig_leafless", {
    description = S("Leafless twig"),
    drawtype = "torchlike",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    is_ground_content = false,
    groups = {solid = 0, suffocates = 0, snappy = 3, attached_node = 1, stick = 1},
    tiles = { "twig_leafless.png" },
    sounds = soundlib.wood(),
    drop = mod_name..":stick",
    wield_image = "twig_leafless.png",
    inventory_image = "twig_leafless.png",
    node_box = {
        type = "fixed",
        fixed = {0, 0, 0, 0, 0, 0}
    },
    selection_box = {
		type = "wallmounted",
		wall_side = {-0.5, -0.2, -0.2, 0.5, 0.2, 0.2},
	},
    use_texture_alpha = "blend",
})

core.register_node(mod_name..":twig_straight", {
    description = S("Straight twig"),
    drawtype = "plantlike",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    is_ground_content = false,
    node_box = {
        type = "fixed",
        fixed = {0, 0, 0, 0, 0, 0}
    },
    selection_box = {
        type = "fixed",
        fixed = {
            0.125, 0.5, 0.125, 
            -0.125, -0.5, -0.125
        }
    },
    wield_image = "twig_straight.png",
    inventory_image = "twig_straight.png",
    groups = {solid = 0, suffocates = 0, snappy = 3, attached_node = 1, stick = 1},
    tiles = { "twig_straight.png" },
    sounds = soundlib.wood(),
    drop = mod_name..":stick",
})

core.register_node(mod_name..":young_stem_middle", {
    description = S("Young middle stem"),
    drawtype = "plantlike",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    is_ground_content = false,
    --walkable = false,
    node_box = {
        type = "fixed",
        fixed = {0, 0, 0, 0, 0, 0}
    },
    selection_box = {
        type = "fixed",
        fixed = {
            0.125, 0.5, 0.125, 
            -0.125, -0.5, -0.125
        }
    },
    wield_image = "young_stem_middle.png",
    inventory_image = "young_stem_middle.png",
    groups = {solid = 0, suffocates = 0, snappy = 3, attached_node = 1, stick = 1},
    tiles = { "young_stem_middle.png" },
    sounds = soundlib.wood(),
    drop = mod_name..":stick",
})

core.register_node(mod_name..":young_stem_bottom", {
    description = S("Young bottom stem"),
    drawtype = "plantlike",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    is_ground_content = false,
    --walkable = false,
    node_box = {
        type = "fixed",
        fixed = {0, 0, 0, 0, 0, 0}
    },
    selection_box = {
        type = "fixed",
        fixed = {
            0.125, 0.5, 0.125, 
            -0.125, -0.5, -0.125
        }
    },
    wield_image = "young_stem.png",
    inventory_image = "young_stem.png",
    groups = {solid = 0, suffocates = 0, snappy = 3, attached_node = 1, stick = 1},
    tiles = { "young_stem.png" },
    sounds = soundlib.wood(),
    drop = mod_name..":stick",
})