local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

stone = {}

dofile(mod_path .. "/nodes.lua")
dofile(mod_path .. "/crafts.lua")