local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

core.register_node(mod_name..":flint", {
    description = S("Flint"),
    groups = { flint = 1, solid = 0, suffocates = 0, pickable = 1, attached_node = 1, pebble = 1, stripping = 1, },

    inventory_image = "flint.png",
    wield_image = "flint.png",
    tiles = {"flint_node.png"},
    drawtype = "nodebox",
    paramtype = "light",
    sunlight_propagates = true,
    is_ground_content = false,
    sounds = soundlib.pebble(),
    walkable = false,

    node_box = {
        type = "fixed",
        fixed = {-0.1875, -0.5, -0.1875,    0.1875, -0.3125, 0.1875},
    },
    selection_box = {
            type = "fixed",
            fixed = {-0.1875, -0.5, -0.1875,    0.1875, -0.3125, 0.1875},
    },

    tool_capabilities = {
        full_punch_interval = 0.5,
        groupcaps = {
            strippable = {
                times = {4},
                uses = 0,
                level = 0
            },
        },
        damage_groups = { fleshy = 1 },
    },
})

core.register_node(mod_name..":flint_block", {
    description = S("Flint block"),
    groups = { flint = 1, solid = 1, suffocates = 1, cracky = 1, stone = 1, },

    tiles = {"flint_node.png"},
    is_ground_content = false,
    sounds = soundlib.stone(),
})

core.register_craftitem(mod_name..":flint_chip", {
    description = S("Flint chip"),
    inventory_image = "flint_chip.png",
    groups = {craftitem = 1, stripping = 1, flint = 1},

    tool_capabilities = {
        full_punch_interval = 0.5,
        groupcaps = {
            strippable = {
                times = {4},
                uses = 0,
                level = 0
            },
        },
        damage_groups = { fleshy = 1 },
    },
})

core.register_craftitem(mod_name..":knife_head_flint", {
    description = S("Flint knife head"),
    inventory_image = "knife_head_flint.png",
    groups = {craftitem = 1, stripping = 1, flint = 1},

    tool_capabilities = {
        full_punch_interval = 0.5,
        groupcaps = {
            strippable = {
                times = {4},
                uses = 0,
                level = 0
            },
        },
        damage_groups = { fleshy = 1 },
    },
})

core.register_craftitem(mod_name..":axe_head_flint", {
    description = S("Flint axe head"),
    inventory_image = "axe_head_flint.png",
    groups = {craftitem = 1, stripping = 1, flint = 1},

    tool_capabilities = {
        full_punch_interval = 0.5,
        groupcaps = {
            strippable = {
                times = {4},
                uses = 0,
                level = 0
            },
        },
        damage_groups = { fleshy = 1 },
    },
})

core.register_craftitem(mod_name..":pickaxe_head_flint", {
    description = S("Flint pickaxe head"),
    inventory_image = "pickaxe_head_flint.png",
    groups = {craftitem = 1, stripping = 1, flint = 1},

    tool_capabilities = {
        full_punch_interval = 0.5,
        groupcaps = {
            strippable = {
                times = {4},
                uses = 0,
                level = 0
            },
        },
        damage_groups = { fleshy = 1 },
    },
})