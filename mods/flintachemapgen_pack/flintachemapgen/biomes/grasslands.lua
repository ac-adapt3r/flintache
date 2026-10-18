local sealevel = 0
local alt_max = 1000
local alt_min = -1000

local this_biome = "grasslands"

-------------------------------
------------ BIOME ------------
-------------------------------

core.register_biome({
    name = this_biome,

    node_top = "soil:grass",
    depth_top = 1,

    node_filler = "soil:dirt",
    depth_filler = 5,

    node_river_water = "liquids:river_water_source",

    node_riverbed = "soil:sand",
    depth_riverbed = 2,

    y_max = alt_max,
    y_min = sealevel+2,
    vertical_blend = 2,

    heat_point = 50,
    humidity_point = 50,
})
----------------
--  ores      --
----------------

-- ROCKY DIRT

core.register_ore({
    ore_type = "scatter",
    ore = "soil:rocky_dirt",
    wherein = "soil:dirt",
    clust_size = 2,
    clust_scarcity = 15,
    y_min = alt_min,
    y_max = alt_max,
})


-------------------------------
--------- DECORATIONS ---------
-------------------------------

local sch = mapgen.get_schematic_path

-- ruins

core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 80,
    fill_ratio = 0.00001,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("ruins1"),
    flags = "place_center_x, place_center_z, place_center_y, force_placement",
    rotation = "random",
    biomes = {this_biome},
})

-- boulders

local boulder_amount = 7

local boulder_chance = 0.0001 / boulder_amount

core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 80,
    fill_ratio = boulder_chance,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("copper_boulder1"),
    flags = "place_center_x, place_center_z, place_center_y, force_placement",
    rotation = "random",
    biomes = {this_biome},
})

core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 80,
    fill_ratio = boulder_chance,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("copper_boulder2"),
    flags = "place_center_x, place_center_z, force_placement",
    rotation = "random",
    biomes = {this_biome},
})

core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 80,
    fill_ratio = boulder_chance,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("copper_boulder3"),
    flags = "place_center_x, place_center_z, force_placement",
    rotation = "random",
    biomes = {this_biome},
})

core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 80,
    fill_ratio = boulder_chance,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("copper_boulder4"),
    flags = "place_center_x, place_center_z, place_center_y, force_placement",
    rotation = "random",
    biomes = {this_biome},
})

core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 80,
    fill_ratio = boulder_chance,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("boulder1"),
    flags = "place_center_x, place_center_z, place_center_y, force_placement",
    rotation = "random",
    biomes = {this_biome},
})

core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 80,
    fill_ratio = boulder_chance,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("boulder2"),
    flags = "place_center_x, place_center_z, place_center_y, force_placement",
    rotation = "random",
    biomes = {this_biome},
})

core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 80,
    fill_ratio = boulder_chance,
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("boulder3"),
    flags = "place_center_x, place_center_z, place_center_y, force_placement",
    rotation = "random",
    biomes = {this_biome},
})



-- tree
core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 80,
    noise_params = {
        offset = 0,
        scale = 0.001,
        spread = {x = 10, y = 10, z = 10},
        seed = 69,
        octaves = 4,
        persistence = 0.2,
        lacunarity = 1.0,
    },
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("tree"),
    flags = "place_center_x, place_center_z",
    rotation = "random",
    biomes = {this_biome},
})

-- bush
core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 80,
    noise_params = {
        offset = 0,
        scale = 0.001,
        spread = {x = 10, y = 10, z = 10},
        seed = 12038,
        octaves = 4,
        persistence = 0.2,
        lacunarity = 1.0,
    },
    y_max = alt_max,
    y_min = sealevel,
    schematic = sch("bush"),
    flags = "place_center_x, place_center_z",
    rotation = "random",
    biomes = {this_biome},
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

-- starflower

core.register_decoration({
    deco_type = "simple",
    place_on = {"soil:grass"},
    sidelen = 16,
    fill_ratio = 0.0011,
    noise_params = {
        offset  = 0,
        scale   = 0.1,
        spread  = {x=16, y=16, z=16},
        seed    = 12321,
        octaves = 2,
        persistence = 0.3,
        lacunarity = 1.0,
        flags = "eased",
    },
    biomes = {this_biome},
    y_max = alt_max,
    y_min = sealevel,
    decoration = "plants:starflower",
})

-- dream flower

core.register_decoration({
    deco_type = "simple",
    place_on = {"soil:grass"},
    sidelen = 16,
    fill_ratio = 0.0011,
    noise_params = {
        offset  = 0,
        scale   = 0.1,
        spread  = {x=16, y=16, z=16},
        seed    = 12321,
        octaves = 2,
        persistence = 0.3,
        lacunarity = 1.0,
        flags = "eased",
    },
    biomes = {this_biome},
    y_max = alt_max,
    y_min = sealevel,
    decoration = "plants:daydreamer",
})

-- flowering clovers

core.register_decoration({
    deco_type = "simple",
    place_on = {"group:soil"},

    sidelen = 16,
    fill_ratio = 0.01,
    noise_params = {
        offset  = 0,
        scale   = 0.5,
        spread  = {x=1.5, y=1, z=1.5},
        seed    = 131239,
        octaves = 2,
        persistence = 0.1,
        lacunarity = 1.0,
        --flags = "eased",
    },

    biomes = {this_biome},
    y_max = alt_max,
    y_min = sealevel,
    decoration = "plants:clovers_flowering",
})

-- clovers

core.register_decoration({
    deco_type = "simple",
    place_on = {"group:soil"},

    sidelen = 16,
    fill_ratio = 0.0222,
    noise_params = {
        offset  = 0,
        scale   = 0.5,
        spread  = {x=1, y=1, z=1},
        seed    = 131239,
        octaves = 2,
        persistence = 0.3,
        lacunarity = 1.0,
        --flags = "eased",
    },

    biomes = {this_biome},
    y_max = alt_max,
    y_min = sealevel,
    decoration = "plants:clovers",
})
