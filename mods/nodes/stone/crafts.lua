local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

-- pebbles to cobblestone
core.register_craft({
    type = "shaped",
    output = mod_name..":cobblestone 1",
    recipe = {
        {"pebbles:pebble", "pebbles:pebble", "pebbles:pebble"},
        {"pebbles:pebble", "pebbles:pebble", "pebbles:pebble"},
        {"pebbles:pebble", "pebbles:pebble", "pebbles:pebble"},
    },
})

-- cobblestone to pebbles
core.register_craft({
    type = "shapeless",
    output = "pebbles:pebble 9",
    recipe = {
        mod_name..":cobblestone",
    }
})

core.register_craft({
    type = "shapeless",
    output = "stone:slightly_mossy_cobblestone 1",
    recipe = {
        "stone:cobblestone",
        "plants:grass"
    },
})

core.register_craft({
    type = "shapeless",
    output = "stone:mossy_cobblestone 1",
    recipe = {
        "stone:slightly_mossy_cobblestone",
        "plants:grass"
    },
})

core.register_craft({
    type = "shapeless",
    output = "stone:mossy_cobblestone 1",
    recipe = {
        "stone:cobblestone",
        "plants:moss"
    },
})

core.register_craft({
    type = "shaped",
    output = "stone:raw_pyrite_block",
    recipe = {
        {"pebbles:pyrite", "pebbles:pyrite", "pebbles:pyrite", },
        {"pebbles:pyrite", "pebbles:pyrite", "pebbles:pyrite", },
        {"pebbles:pyrite", "pebbles:pyrite", "pebbles:pyrite", },
    }
})