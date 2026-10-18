local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)



--------------
--   DIRT   --
--------------

-- DIRT
core.register_node("soil:dirt", {
    description = S("Dirt"),
    groups = { item_dirt = 1, solid = 1, suffocates = 2, crumbly = 1, soil = 1, dirt = 1, grass_can_grow = 1, can_be_heated = 1, },
    tiles = {
        "dirt.png" ,
        "dirt.png",
        "dirt_side.png" ,
    },
    sounds = soundlib.soil(),

    heated_node = mod_name..":dry_dirt",
    max_heat = 5,
})

-- ROOTED DIRT
core.register_node("soil:rooted_dirt", {
    description = S("Rooted dirt"),
    groups = { item_dirt = 1, solid = 1, suffocates = 2, crumbly = 3, soil = 1, dirt = 1, },
    tiles = {
        "rooted_dirt.png" ,
        "rooted_dirt.png",
        "rooted_dirt_side.png" ,
    },
    sounds = soundlib.soil(),
})

-- ROCKY DIRT
core.register_node("soil:rocky_dirt", {
    description = S("Rocky Dirt"),
    groups = { item_dirt = 1, solid = 1, suffocates = 2, crumbly = 2, soil = 1, dirt = 1, },
    tiles = { "rocky_dirt.png" },
    sounds = soundlib.soil(),
})

-- DRY DIRT
core.register_node("soil:dry_dirt", {
    description = S("Dry dirt"),
    groups = { item_dirt = 1, solid = 1, suffocates = 2, crumbly = 1, soil = 1, dirt = 1, },
    tiles = {
        "dry_dirt.png" ,
        "dry_dirt.png",
        "dry_dirt_side.png" ,
    },
    sounds = soundlib.soil(),
})

-- LOOSE DIRT
core.register_node("soil:dirt_loose", {
    description = S("Loose dirt"),
    groups = { item_dirt = 1, solid = 1, suffocates = 2, crumbly = 1, soil = 1, dirt = 1, grass_can_grow = 1, falling_node = 1, },
    tiles = {
        "dirt_loose.png" ,
        "dirt_loose.png",
        "dirt_loose_side.png" ,
    },
    sounds = soundlib.soil(),
})

-----------------
-- FOREST SOIL --
-----------------

-- forest soil

core.register_node("soil:forest_soil", {
    description = S("Forest soil"),
    groups = { item_dirt = 1, solid = 1, suffocates = 2, crumbly = 1, soil = 1, dirt = 1, forest_soil = 1, },
    tiles = { "forest_soil.png" },
    sounds = soundlib.soil(),
})

-- rooted forest soil

core.register_node("soil:rooted_forest_soil", {
    description = S("Rooted forest soil"),
    groups = { item_dirt = 1, solid = 1, suffocates = 2, crumbly = 3, soil = 1, dirt = 1, forest_soil = 1, },
    tiles = { "rooted_forest_soil.png" },
    sounds = soundlib.soil(),
})

-- rocky forest soil

core.register_node("soil:rocky_forest_soil", {
    description = S("Rocky Forest Soil"),
    groups = { item_dirt = 1, solid = 1, suffocates = 2, crumbly = 2, soil = 1, dirt = 1, forest_soil = 1, },
    tiles = { "rocky_forest_soil.png" },
    sounds = soundlib.soil(),
})

-----------------------

-- SAND
core.register_node("soil:sand", {
    description = S("Sand"),
    groups = { item_sand = 1, solid = 1, falling_node = 1, suffocates = 2, crumbly = 1, sand = 1},
    tiles = {
        "sand.png",
        "sand.png",
        "sand_side.png",
    },
    sounds = soundlib.sand(),
})

-- GRASS BLOCK
core.register_node("soil:grass", {
    description = S("Grassy dirt"),
    groups = { dirt_grass = 1, solid = 1, suffocates = 2, topsoil = 1, crumbly = 2, soil = 1, dirt = 1, spreads_to_dirt = 1, },
    tiles = {
        "grass.png",
        "dirt.png",
        "grass_side.png",
    },
    drop = "soil:dirt",
    sounds = soundlib.grass(),
})

-- GRASS BLOCK
core.register_node("soil:rooted_grass", {
    description = S("Rooted grassy dirt"),
    groups = { dirt_grass = 1, solid = 1, suffocates = 2, topsoil = 1, crumbly = 2, soil = 1, dirt = 1, spreads_to_dirt = 1, },
    tiles = {
        "grass.png",
        "rooted_dirt.png",
        "rooted_grassy_dirt_side.png",
    },
    drop = "soil:dirt",
    sounds = soundlib.grass(),
})

-- GRAVEL
core.register_node("soil:gravel", {
    description = S("Gravel"),
    groups = { solid = 1, falling_node = 1, suffocates = 2, crumbly = 3, },
    tiles = { "gravel.png" },
    sounds = soundlib.gravel(),
    drop = {
		max_items = 1,
		items = {
			{items = {"flint:flint"}, rarity = 5},
			{items = {"soil:gravel"}}
		}
	},
})

-----------=========== CRAFTS ===========-----------

core.register_craft({
    type = "shapeless",
    output = "soil:rocky_dirt",
    recipe = {
        "soil:dirt",
        "pebbles:pebble"
    },
})

--[[core.register_craft({
    type = "shapeless",
    output = "soil:flinty_dirt",
    recipe = {
        "soil:dirt",
        "group:flint"
    },
})]]



core.register_craft({
    type = "shapeless",
    output = "soil:rocky_forest_soil",
    recipe = {
        "soil:forest_soil",
        "pebbles:pebble"
    },
})

--[[core.register_craft({
    type = "shapeless",
    output = "soil:flinty_forest_soil",
    recipe = {
        "soil:forest_soil",
        "group:flint"
    },
})]]