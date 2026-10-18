local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

core.register_node("pebbles:hammerstone", {
  description = S("Hammerstone"),
  inventory_image = "hammerstone_item.png",
  wield_image = "hammerstone_item.png",
  drawtype = "nodebox",
  paramtype = "light",
  sunlight_propagates = true,
  is_ground_content = false,
  groups = {solid = 0, suffocates = 0, pickable = 1, attached_node = 1, pebble = 1, },
  tiles = { "stone.png" },
  sounds = soundlib.pebble(),
  walkable = false,
  node_box = {
    type = "fixed",
    fixed = {-0.125, -0.5, -0.125,    0.125, -0.375, 0.125},
	},
  selection_box = {
		type = "fixed",
		fixed = {-0.125, -0.5, -0.125,    0.125, -0.375, 0.125},
	},
  tool_capabilities = {
    full_punch_interval = 0.45,
    groupcaps = {},
    damage_groups = { flint = 1, fleshy = 2 },
  },
})

core.register_node("pebbles:pyrite", {
  description = S("Raw pyrite"),
  inventory_image = "pyrite_item.png",
  wield_image = "pyrite_item.png",
  drawtype = "nodebox",
  paramtype = "light",
  sunlight_propagates = true,
  is_ground_content = false,
  groups = {solid = 0, suffocates = 0, pickable = 1, attached_node = 1, pebble = 1, },
  tiles = { "pyrite.png" },
  sounds = soundlib.pebble(),
  walkable = false,
  node_box = {
    type = "fixed",
    fixed = {-0.125, -0.5, -0.125,    0.125, -0.3125, 0.125},
	},
  selection_box = {
		type = "fixed",
		fixed = {-0.125, -0.5, -0.125,    0.125, -0.3125, 0.125},
	},
})