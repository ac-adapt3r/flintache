local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

local plants = {}


core.register_craft({
    type = "shapeless",
    output = mod_name..":moss_sparse 2",
    recipe = {mod_name..":moss"},
})

core.register_craft({
    type = "shapeless",
    output = mod_name..":moss",
    recipe = {mod_name..":moss_sparse", mod_name..":moss_sparse"},
})