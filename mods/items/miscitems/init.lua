local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

---------------- items -----------------

core.register_craftitem("miscitems:resin", {
    description = S("Resin"),
    inventory_image = "resin.png",
    groups = {craftitem = 1, item_resin = 1},
})

core.register_craftitem("miscitems:wood_fibers", {
    description = S("Bark strips"),
    inventory_image = "fibers.png",
    groups = {craftitem = 1, },
})

--------------- crafts -----------------

core.register_craft({
    type = "shapeless",
    output = "plants:stick 4",
    recipe = {
        "building:planks",
        "tools:flint_axe"
    },
    replacements = {
        {"tools:flint_axe", "tools:flint_axe"}
    }
})