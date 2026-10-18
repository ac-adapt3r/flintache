-- these tell core what nodes to generate in the world
core.register_alias("mapgen_stone", "stone:stone")
core.register_alias("mapgen_water_source", "liquids:water_source")
core.register_alias("mapgen_river_water_source", "liquids:river_water_source")

mapgen = {}

local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)

function mapgen.get_schematic_path(name)
    return (mod_path .. "/schematics/" .. name .. ".mts")
end

-- biomes
dofile(mod_path .. "/biomes/forest.lua")
dofile(mod_path .. "/biomes/dense_forest.lua")
dofile(mod_path .. "/biomes/grasslands.lua")
dofile(mod_path .. "/biomes/ocean.lua")
dofile(mod_path .. "/biomes/beach.lua")