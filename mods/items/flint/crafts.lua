local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

core.register_craft({
    type = "shaped",
    output = mod_name..":flint_block 1",
    recipe = {
        {mod_name..":flint", mod_name..":flint", mod_name..":flint", },
        {mod_name..":flint", mod_name..":flint", mod_name..":flint", },
        {mod_name..":flint", mod_name..":flint", mod_name..":flint", },
    }
})


core.register_craft({
    type = "shapeless",
    output = mod_name..":axe_head_flint",
    recipe = {mod_name..":flint", "pebbles:hammerstone"},
    replacements = {
        {mod_name..":flint", mod_name..":flint_chip"},
        {"pebbles:hammerstone", "pebbles:hammerstone"}
    }
})

core.register_craft({
    type = "shapeless",
    output = mod_name..":pickaxe_head_flint",
    recipe = {mod_name..":axe_head_flint", "pebbles:hammerstone"},
    replacements = {
        {mod_name..":axe_head_flint", mod_name..":flint_chip"},
        {"pebbles:hammerstone", "pebbles:hammerstone"}
    }
})

core.register_craft({
    type = "shapeless",
    output = mod_name..":knife_head_flint",
    recipe = {mod_name..":pickaxe_head_flint", "pebbles:hammerstone"},
    replacements = {
        {mod_name..":pickaxe_head_flint", mod_name..":flint_chip"},
        {"pebbles:hammerstone", "pebbles:hammerstone"}
    }
})

core.register_craft({
    type = "shapeless",
    output = mod_name..":flint_chip",
    recipe = {mod_name..":knife_head_flint", "pebbles:hammerstone"},
    replacements = {
        {mod_name..":knife_head_flint", mod_name..":flint_chip"},
        {"pebbles:hammerstone", "pebbles:hammerstone"}
    }
})