local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

-- planks
core.register_craft({
    type = "shapeless",
    output = "building:planks 4",
    recipe = {
        "group:oak_log"
    },
})

-- sandstone bricks
core.register_craft({
    type = "shaped",
    output = "building:sandstone_bricks 4",
    recipe = {
        {"soil:sand", "soil:sand"},
        {"soil:sand", "soil:sand"},
    },
})

-- sandstone bricks
core.register_craft({
    type = "shaped",
    output = "building:rope 1",
    recipe = {
        {"miscitems:wood_fibers"},
        {"miscitems:wood_fibers"},
        {"miscitems:wood_fibers"},
    },
})