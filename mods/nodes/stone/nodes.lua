local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

-- STONE
core.register_node("stone:stone", {
    description = S("Stone"),
    groups = { solid = 1, suffocates = 2, cracky = 2, stone = 1},
    tiles = { "stone.png" },
    sounds = soundlib.stone(),
    drop = {"stone:cobblestone"},
})

-- COBBLESTONE
core.register_node("stone:cobblestone", {
    description = S("Cobblestone"),
    groups = { solid = 1, suffocates = 2, cracky = 1, stone = 1},
    tiles = { "cobblestone.png" },
    sounds = soundlib.stone(),
})

-- SLIGHTLY MOSSY COBBLESTONE
core.register_node("stone:slightly_mossy_cobblestone", {
    description = S("Slightly mossy cobblestone"),
    groups = { solid = 1, suffocates = 2, cracky = 1, stone = 1},
    tiles = { "slightly_mossy_cobblestone.png" },
    sounds = soundlib.stone(),
})

-- MOSSY COBBLESTONE
core.register_node("stone:mossy_cobblestone", {
    description = S("Mossy cobblestone"),
    groups = { solid = 1, suffocates = 2, cracky = 1, stone = 1},
    tiles = { "cobblestone_mossy.png" },
    sounds = soundlib.stone(),
})

-- PYRITE COBBLE
core.register_node(mod_name..":raw_pyrite_block", {
    description = S("Raw pyrite block"),
    is_ground_content = false,
    groups = {solid = 1, suffocates = 1, stone = 1, cracky = 1, },
    tiles = { "pyrite.png" },
    sounds = soundlib.stone(),
  })