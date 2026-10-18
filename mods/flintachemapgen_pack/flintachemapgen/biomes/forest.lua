local sealevel = 0
local alt_max = 1000
local alt_min = -1000

local this_biome = "forest"

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

    node_riverbed = "soil:gravel",
    depth_riverbed = 2,

    y_max = alt_max,
    y_min = sealevel+1,
    vertical_blend = 2,

    heat_point = 40,
    humidity_point = 60,
})

-------------------------------
--------- DECORATIONS ---------
-------------------------------

local sch = mapgen.get_schematic_path


-------------------
---trees        ---
-------------------

-- tree
core.register_decoration({
    deco_type = "schematic",
    place_on = {"group:soil"},
    sidelen = 16,
    fill_ratio = 0.004,
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
        scale = 0.004,
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


-----------------------------------------------
--- plants                                  ---
-----------------------------------------------

-- pebble

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

-- fern

core.register_decoration({
    deco_type = "simple",
    place_on = {"soil:grass"},
    sidelen = 16,
    fill_ratio = 0.01,
    biomes = {this_biome},
    y_max = 200,
    y_min = 0,
    decoration = "plants:fern",
})

-- moss

core.register_decoration({
    deco_type = "simple",
    place_on = {"plants:tree_log"},
    sidelen = 16,
    fill_ratio = 1,
    biomes = {this_biome},
    y_max = 200,
    y_min = 0,
    decoration = "plants:moss",
})