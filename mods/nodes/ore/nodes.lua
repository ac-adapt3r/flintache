local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

-- COPPER ORE
core.register_node(mod_name..":copper_ore", {
    description = S("Copper ore"),
    groups = { solid = 1, suffocates = 2, cracky = 2, stone = 1, can_be_heated = 1, ore = 1, },
    tiles = { "copper_ore.png" },
    sounds = soundlib.stone(),

    heated_node = mod_name..":copper_ore_cracked",
    max_heat = 10,
    heated_sound = "rock_crack",
})

-- SPARSE COPPER ORE
core.register_node(mod_name..":sparse_copper_ore", {
    description = S("Sparse copper ore"),
    groups = { solid = 1, suffocates = 2, cracky = 2, stone = 1, can_be_heated = 1, ore = 1, },
    tiles = { "sparse_copper_ore.png" },
    sounds = soundlib.stone(),

    heated_node = mod_name..":sparse_copper_ore_cracked",
    max_heat = 10,
    heated_sound = "rock_crack",
})


-- *CRACKED* COPPER ORE
core.register_node(mod_name..":copper_ore_cracked", {
    description = S("Cracked copper ore"),
    groups = { solid = 1, suffocates = 2, cracky = 1, stone = 1, ore = 1, },
    tiles = { "copper_ore_cracked.png" },
    sounds = soundlib.stone(),

    drop = mod_name..":raw_copper 2",
})

-- *CRACKED* SPARSE COPPER ORE
core.register_node(mod_name..":sparse_copper_ore_cracked", {
    description = S("Cracked sparse copper ore"),
    groups = { solid = 1, suffocates = 2, cracky = 1, stone = 1, ore = 1, },
    tiles = { "sparse_copper_ore_cracked.png" },
    sounds = soundlib.stone(),

    drop = mod_name..":raw_copper",
})

