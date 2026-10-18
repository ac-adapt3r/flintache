local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

core.register_craftitem(mod_name..":raw_copper", {
    description = S("Raw copper"),
    inventory_image = "raw_copper.png",
    groups = {craftitem = 1, copper = 1, },
})