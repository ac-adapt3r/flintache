local sealevel = 0
local alt_max = 1000
local alt_min = -1000

local this_biome = "dense_forest"

-------------------------------
------------ BIOME ------------
-------------------------------

core.register_biome({
    name = this_biome,

    node_top = "soil:forest_soil",
    depth_top = 1,

    node_filler = "soil:dirt",
    depth_filler = 5,

    node_river_water = "liquids:river_water_source",

    node_riverbed = "soil:gravel",
    depth_riverbed = 2,

    y_max = alt_max,
    y_min = sealevel,
    vertical_blend = 2,

    heat_point = 30,
    humidity_point = 70,
})

-------------------------------
--------- DECORATIONS ---------
-------------------------------

local sch = mapgen.get_schematic_path

------------------
---coast       ---
------------------

--coast gravel
core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.5,
    y_max = sealevel+1,
    y_min = sealevel,
    schematic = sch("gravel"),
    flags = "force_placement",
    --rotation = "random",
    spawn_by = "liquids:water_source",
    num_spawn_by = 1,
    biomes = {this_biome},
})

-------
---bushes
---

-- bush
core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    fill_ratio = 0.017,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("bush"),
    flags = "place_center_x, place_center_z, place_center_y, force_placement",
    rotation = "random",
    biomes = {this_biome},
})

-- small bush

core.register_decoration({
    deco_type = "simple",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.013,
    biomes = {this_biome},
    y_max = alt_max,
    y_min = sealevel,
    decoration = "plants:small_bush",
})


-------------------
---trees        ---
-------------------

core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.009,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("tree_tall_forest_1"),
    flags = "place_center_x, place_center_z, place_center_y, force_placement",
    rotation = "random",
    biomes = {this_biome},
})

core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.009,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("tree_normal_forest_1"),
    flags = "place_center_x, place_center_z, place_center_y, force_placement",
    rotation = "random",
    biomes = {this_biome},
})


core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.003,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("young_tree_1"),
    flags = "place_center_x, place_center_z, force_placement",
    rotation = "random",
    biomes = {this_biome},
})

core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.003,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("young_tree_2"),
    flags = "place_center_x, place_center_z, force_placement",
    rotation = "random",
    biomes = {this_biome},
})

core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.003,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("young_tree_3"),
    flags = "place_center_x, place_center_z, force_placement",
    rotation = "random",
    biomes = {this_biome},
})

----------------------
---fallen trunks   ---
----------------------

core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.00003,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("fallen_trunk_1"),
    flags = "force_placement",
    rotation = "random",
    biomes = {this_biome},
})

core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.00003,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("fallen_trunk_2"),
    flags = "place_center_x, place_center_z",
    rotation = "random",
    biomes = {this_biome},
})

----------------------
---stumps          ---
----------------------

core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.00003,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("tree_stump_1"),
    flags = "place_center_x, place_center_z, force_placement",
    rotation = "random",
    biomes = {this_biome},
})

core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.00003,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("tree_stump_2"),
    flags = "place_center_x, place_center_z, force_placement",
    rotation = "random",
    biomes = {this_biome},
})

-----------------------------------------------
--- other plants                            ---
-----------------------------------------------



-- tall grass

core.register_decoration({
    deco_type = "simple",
    place_on = {"soil:grass"},
    sidelen = 16,
    fill_ratio = 0.333,
    biomes = {this_biome},
    y_max = alt_max,
    y_min = sealevel,
    decoration = {
        "plants:grass_1",
        "plants:grass_2",
        "plants:grass_3",
    },
    param2 = 4 + 0x08
})


-- fern

core.register_decoration({
    deco_type = "simple",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.03,
    biomes = {this_biome},
    y_max = alt_max,
    y_min = sealevel,
    decoration = "plants:fern",
})

-- sparse moss

core.register_decoration({
    deco_type = "simple",
    place_on = {"group:forest_soil"},

    noise_params = {
        offset  = 0,
        scale   = 1,
        spread  = {x=32, y=32, z=32},
        seed    = 99287,
        octaves = 4,
        persistence = 0.5,
        lacunarity = 2.0,
        --flags = "eased",
    },
    sidelen = 16,
    --fill_ratio = 0.0333,

    biomes = {this_biome},
    y_max = alt_max,
    y_min = sealevel,

    decoration = "plants:moss_sparse",
    param2 = 1,
})

-- flowery sparse moss

core.register_decoration({
    deco_type = "simple",
    place_on = {"group:forest_soil"},

    fill_ratio = 0.005,

    biomes = {this_biome},
    y_max = alt_max,
    y_min = sealevel,

    decoration = "plants:moss_sparse_flowery",
    param2 = 1,
})

core.register_decoration({
    deco_type = "simple",
    place_on = {"soil:grass"},

    fill_ratio = 0.01,

    biomes = {this_biome},
    y_max = alt_max,
    y_min = sealevel,

    decoration = "plants:forest_flower_yellow",
    param2 = 1,
})

----------------
--litter      --
----------------

-- stick
core.register_decoration({
    deco_type = "simple",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.01,
    biomes = {this_biome},
    y_max = alt_max,
    y_min = sealevel,
    decoration = "plants:stick",
    rotation = "random",
})

-- pebbles
core.register_decoration({
    deco_type = "simple",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.005,
    biomes = {this_biome},
    y_max = alt_max,
    y_min = sealevel,
    decoration = "pebbles:hammerstone",
    rotation = "random",
})

core.register_decoration({
    deco_type = "simple",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.002,
    biomes = {this_biome},
    y_max = alt_max,
    y_min = sealevel,
    decoration = "pebbles:pyrite",
    rotation = "random",
})

core.register_decoration({
    deco_type = "simple",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.002,
    biomes = {this_biome},
    y_max = alt_max,
    y_min = sealevel,
    decoration = "flint:flint",
    rotation = "random",
})


core.register_decoration({
    deco_type = "simple",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.002,
    biomes = {this_biome},
    y_max = alt_max,
    y_min = sealevel,
    decoration = "pebbles:pyrite",
    rotation = "random",
})

-- GRASS CLUMPS

--[[core.register_ore({
    ore_type = "scatter",
    ore = "soil:grass",
    wherein = "soil:forest_soil",
    clust_scarcity = 8 * 8 * 8,
    clust_num_ores = 80,
    clust_size = 6,
    y_min = alt_min,
    y_max = alt_max,
})]]

core.register_ore({
    ore_type = "blob",
    ore = "soil:grass",
    wherein = "soil:forest_soil",
    noise_params = {
        offset  = 0,
        scale   = 3,
        spread  = {x=16, y=16, z=16},
        seed    = 5390,
        octaves = 4,
        persistence = 0.5,
        lacunarity = 2.0,
        flags = "eased",
    },
    noise_threshold = 1.6,
    clust_size = 6,
    clust_scarcity = 26,
    y_min = alt_min,
    y_max = alt_max,
})

-- ROCKY FOREST SOIL

core.register_ore({
    ore_type = "scatter",
    ore = "soil:rocky_forest_soil",
    wherein = "soil:forest_soil",
    clust_scarcity = 8 * 8 * 8,
    clust_num_ores = 24,
    clust_size = 5,
    y_min = alt_min,
    y_max = alt_max,
})