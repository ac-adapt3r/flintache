local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

liquids = {}

-- makes nodes
dofile(mod_path .. "/nodes.lua")
