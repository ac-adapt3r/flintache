local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

-- makes nodes
dofile(mod_path .. DIR_DELIM .. "nodes.lua")
dofile(mod_path .. DIR_DELIM .. "items.lua")
--dofile(mod_path .. DIR_DELIM .. "abms.lua")