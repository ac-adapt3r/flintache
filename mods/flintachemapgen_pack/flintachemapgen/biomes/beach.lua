local sealevel = 0
local alt_max = 1000
local alt_min = -1000

local this_biome = "beach"

-------------------------------
------------ BIOME ------------
-------------------------------

core.register_biome({
    name = this_biome,

    node_top = "soil:sand",
    depth_top = 3,

    node_filler = "soil:gravel",
    depth_filler = 3,

    node_riverbed = "soil:sand",
    depth_riverbed = 3,

    y_max = sealevel+3,
    y_min = sealevel,
    vertical_blend = 2,

    heat_point = 50,
    humidity_point = 60,
})