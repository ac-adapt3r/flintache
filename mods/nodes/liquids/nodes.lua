core.register_node("liquids:water_source", {
    description = "Water Source",
    groups = { water_source = 1, liquid = 1, water = 1, flowing = 0},

    tiles = { {
        name = "water.png^[opacity:190",
        backface_culling = false,
        animation = {
          type = "vertical_frames",
          aspect_w = 16,
          aspect_h = 16,
          length = 2.0,
        },
    } },
    use_texture_alpha = "blend",
    drawtype = "liquid",
    paramtype = "light",
    waving = 3,

    sounds = soundlib.water(),

    walkable = false,
    liquid_move_physics = true,
    move_resistance = 1,
    pointable = false,
    diggable = false,
    buildable_to = true,
    liquidtype = "source",
    liquid_viscosity = 0,
    liquid_renewable = false,
    liquid_range = 8,
    liquid_alternative_source = "liquids:water_source",
    liquid_alternative_flowing = "liquids:water_flowing",
    drowning = 2,
    --_on_node_update = pmb_fluid_api.flow_maybe(0.5)
    post_effect_color = "#1854a350",
  })

  core.register_node("liquids:water_flowing", {
    description = "Water Flowing",
    groups = { water_flowing = 1, liquid = 1, water = 1, flowing = 1},

    special_tiles = {
      {
        name = "water_flowing.png^[opacity:190",
        backface_culling = false,
        animation = {
          type = "vertical_frames",
          aspect_w = 16,
          aspect_h = 16,
          length = 0.4,
        },
    },
    {
      name = "water_flowing.png^[opacity:190",
      backface_culling = false,
      animation = {
        type = "vertical_frames",
        aspect_w = 16,
        aspect_h = 16,
        length = 0.4,
      },
  }
    },
    tiles = { {
      name = "water_flowing.png^[opacity:190",
      backface_culling = false,
      animation = {
        type = "vertical_frames",
        aspect_w = 16,
        aspect_h = 16,
        length = 0.4,
      },
  } },

  sounds = soundlib.water(),

  use_texture_alpha = "blend",
  drawtype = "flowingliquid",

  paramtype = "light",
  paramtype2 = "flowingliquid",
  waving = 3,

  walkable = false,
  liquid_move_physics = true,
  move_resistance = 1,
  pointable = false,
  diggable = false,
  buildable_to = true,
  liquidtype = "flowing",
  liquid_viscosity = 0,
  liquid_renewable = false,
  liquid_range = 8,
  liquid_alternative_source = "liquids:water_source",
  liquid_alternative_flowing = "liquids:water_flowing",
  drowning = 2,
  post_effect_color = "#1854a380",
})


----------------------------------------------
----------------RIVER WATER-------------------
----------------------------------------------


core.register_node("liquids:river_water_source", {
    description = "River Water Source",
    groups = { water_source = 1, liquid = 1, water = 1, flowing = 0},

    tiles = { {
        name = "river_water.png^[opacity:190",
        backface_culling = false,
    } },
    use_texture_alpha = "blend",
    drawtype = "liquid",
    paramtype = "light",
    waving = 3,

    walkable = false,
    liquid_move_physics = true,
    move_resistance = 0,
    pointable = false,
    diggable = false,
    buildable_to = true,
    liquidtype = "source",
    liquid_viscosity = 0,
    liquid_renewable = false,
    liquid_range = 2,
    liquid_alternative_source = "liquids:river_water_source",
    liquid_alternative_flowing = "liquids:river_water_flowing",
    --_on_node_update = pmb_fluid_api.flow_maybe(0.5)
  })

  core.register_node("liquids:river_water_flowing", {
    description = "River Water Flowing",
    groups = { water_flowing = 1, liquid = 1, water = 1, flowing = 1},

    special_tiles = {
    {
        name = "river_water.png^[opacity:190",
        backface_culling = false,
    },
    {
        name = "river_water.png^[opacity:190",
        backface_culling = true,
    }
    },
    tiles = {"river_water.png^[opacity:190"},
    use_texture_alpha = "blend",
    drawtype = "flowingliquid",

    paramtype = "light",
    paramtype2 = "flowingliquid",
    waving = 3,

    walkable = false,
    liquid_move_physics = true,
    move_resistance = 0,
    pointable = false,
    diggable = false,
    buildable_to = true,
    liquidtype = "flowing",
    liquid_viscosity = 0,
    liquid_renewable = false,
    liquid_range = 2,
    liquid_alternative_source = "liquids:river_water_source",
    liquid_alternative_flowing = "liquids:river_water_flowing",
  })