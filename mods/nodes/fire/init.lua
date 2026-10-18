local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)
local fire = {}

local function heat(selfpos)
  local positions = {
    {x=0,y=1,z=0},
    {x=0,y=-1,z=0},
    {x=1,y=0,z=0},
    {x=-1,y=0,z=0},
    {x=0,y=0,z=1},
    {x=0,y=0,z=-1},
  }

  for _, pos in ipairs(positions) do
    local pos = vector.add(selfpos, pos)

    local actualnode = core.get_node(pos)
    local node = core.registered_nodes[actualnode.name]

    if node and node.groups and node.groups["can_be_heated"] then
      local meta = core.get_meta(pos)
      local heat = meta:get_int("heat")

      if heat ~= 0 then
        meta:set_int("heat", heat+1)
      else
        meta:set_int("heat", 1) -- if node doesnt have meta add it
      end

      if meta:get_int("heat") >= node.max_heat then
        core.set_node(pos, {name=node.heated_node})

        if node.heated_sound then
          -- Play sound
          local handle = core.sound_play(node.heated_sound, {
            pos = {x=pos.x, y=pos.y, z=pos.z},
            gain = 0.5,
            max_hear_distance = 8,
            loop = false
            }) 
        end
      end
    end


  end
end

-------------============= NODES =============-------------

-- FIRE
core.register_node(mod_name..":fire", {
    description = S("Fire"),

    drawtype = "firelike",
    paramtype = "light",
    sunlight_propagates = true,
    light_source = 12,

    tiles = {{
        name = "fire.png", -- Your texture file
        animation = {
          type = "vertical_frames",       -- Stacked vertically
          aspect_w = 16,                  -- Width of one frame
          aspect_h = 16,                  -- Height of one frame (e.g., 16x16)
          length = 0.4,                   -- Duration per frame (seconds)
          -- For smoother blending, use multiple frames in a tall image
          -- length = 0.05, -- Faster animation
        }
      }},
    
    sounds = {},

    groups = { fire = 1, heatsource = 1, },

    walkable     = false,
    buildable_to = false,

    drop = {},

    damage_per_second = 2,
})



-- STICKS PILE
core.register_node(mod_name..":sticks_pile", {
  description = S("Sticks pile"),
  drawtype = "nodebox",
  paramtype = "light",
  sunlight_propagates = true,
  is_ground_content = false,
  groups = {solid = 0, suffocates = 0, oddly_breakable_by_hand = 1, attached_node = 1, },
  tiles = { "sticks_pile.png" },
  sounds = {},
  walkable     = false,
  wield_image = "sticks_pile.png",
  inventory_image = "sticks_pile.png",
  node_box = {
  type = "fixed",
  fixed = {-0.5, -0.45, -0.5, 0.5, -0.5, 0.5},
},
  selection_box = {
  type = "fixed",
  fixed = {-0.5, -0.45, -0.5, 0.5, -0.5, 0.5},
},
  use_texture_alpha = "blend",
  drop = "plants:stick 2",
})


-- CAMPFIRE
local campfire_base = {
  description = S("Campfire"),

  drawtype = "plantlike",
  waving = false,
  paramtype = "light",
  sunlight_propagates = true,
  light_source = 10,

  tiles = {{
      name = "campfire_animation.png", -- Your texture files
      animation = {
        type = "vertical_frames",       -- Stacked vertically
        aspect_w = 16,                  -- Width of one frame
        aspect_h = 16,                  -- Height of one frame (e.g., 16x16)
        length = 0.4,                   -- Duration per frame (seconds)
        -- For smoother blending, use multiple frames in a tall image
        -- length = 0.05, -- Faster animation
      }
    }},
  inventory_image = "campfire.png",
  wield_image = "campfire.png",
  
  node_box = {
		type = "fixed",
		fixed = {-0.4, -0.38, -0.4, 0.4, -0.5, 0.4},
	},
    selection_box = {
		type = "fixed",
		fixed = {-0.4, -0.38, -0.4, 0.4, -0.5, 0.4},
	},

  sounds = soundlib.sand(),

  groups = { oddly_breakable_by_hand = 3, attached_node = 1, fuelable = 1, meta_based_drops = 1, fire = 1, heatsource = 1, },

  damage_per_second = 1,

  on_construct = function (pos)
    local timer = core.get_node_timer(pos)
    timer:start(3)

    core.sound_play("campfire_lit", {
      pos = pos,
      gain = 1,
      max_hear_distance = 8,
    })

    core.after(0.05, function ()
      local meta = core.get_meta(pos)
      if meta:get_int("heat") == 0 then
        meta:set_int("heat", 11) -- if node doesnt have meta add it
      end

      if meta:get_int("drop_amount") == 0 then
        meta:set_int("drop_amount", 1) -- if node doesnt have meta add it
      end
    end)
  end,

  on_timer = function (selfpos)
    heat(selfpos)

    local meta = core.get_meta(selfpos)
    local heat = meta:get_int("heat")

    if heat > 3 then
      meta:set_int("heat", heat-1)
    elseif heat == 3 then
      meta:set_int("heat", heat-1)
      core.swap_node(selfpos, {name=mod_name..":campfire_depleting"})
    elseif heat > 0 then
      meta:set_int("heat", heat-1)
    else
      core.swap_node(selfpos, {name=mod_name..":extinguished_campfire"})
      core.sound_play("campfire_extinguished", {
        pos = pos,
        gain = 0.4,
        pitch = 1.1,
        max_hear_distance = 8,
      })
    end

    --core.chat_send_all(tostring(heat))

    return true
  end,

  after_dig_node = function (selfpos, self, puncher, pointed_thing)
    local positions = {
      {x=0,y=1,z=0},
      {x=0,y=-1,z=0},
      {x=1,y=0,z=0},
      {x=-1,y=0,z=0},
      {x=0,y=0,z=1},
      {x=0,y=0,z=-1},
    }

    for i, pos in ipairs(positions) do
      local actualnode = core.get_node(pos)
      local node = core.registered_nodes[actualnode.name]

      if node and node.groups and node.groups["can_be_heated"] then
        local meta = core.get_meta(pos)
        meta:set_int("heat", 0)
      end

    end

    core.sound_play("campfire_extinguished", {
      pos = pos,
      gain = 0.4,
      pitch = 1.1,
      max_hear_distance = 8,
    })
  end,

  on_fueled = function (pos, node, player, heat)
    local meta = core.get_meta(pos)
    local drop_amount = meta:get_int("drop_amount")
    meta:set_int("drop_amount", drop_amount+1)

    core.sound_play("campfire_fueled", {
      pos = pos,
      gain = 0.2,
      max_hear_distance = 8,
    })
  end,

  drop = mod_name..":ash"
}

core.register_node(mod_name..":campfire", campfire_base)


local node_def = {
  description = "Depleting campfire",
  tiles = {{
    name = "campfire_low_animation.png", -- Your texture files
    animation = {
      type = "vertical_frames",       -- Stacked vertically
      aspect_w = 16,                  -- Width of one frame
      aspect_h = 16,                  -- Height of one frame (e.g., 16x16)
      length = 0.4,                   -- Duration per frame (seconds)
      -- For smoother blending, use multiple frames in a tall image
      -- length = 0.05, -- Faster animation
    }
  }},
  light_source = 7,

  on_construct = function (pos)
    local timer = core.get_node_timer(pos)
    timer:start(3)
    local meta = core.get_meta(pos)
    meta:set_int("heat", 2) -- if node doesnt have meta add it
    if meta:get_int("drop_amount") == 0 then
      meta:set_int("drop_amount", 1) -- if node doesnt have meta add it
    end
  end,

  on_timer = function (selfpos)
    heat(selfpos)

    local meta = core.get_meta(selfpos)
    local heat = meta:get_int("heat")

    if heat > 3 then
    elseif heat > 0 then
      meta:set_int("heat", heat-1)
    else
      core.swap_node(selfpos, {name=mod_name..":extinguished_campfire"})
      core.sound_play("campfire_extinguished", {
        pos = pos,
        pitch = 1.1,
        gain = 0.4,
        max_hear_distance = 8,
      })
    end

    --core.chat_send_all(tostring(heat))

    return true
  end,

  on_fueled = function (pos, node, player, heat)
    if heat > 3 then
      local meta = core.get_meta(pos)
      local drop_amount = meta:get_int("drop_amount")
      meta:set_int("drop_amount", drop_amount+1)
      
      core.swap_node(pos, {name=mod_name..":campfire"})
      core.sound_play("campfire_fueled", {
        pos = pos,
        gain = 0.2,
        max_hear_distance = 8,
      })
    end
  end
}
-- Merge the base definition into the new node definition
-- (This ensures properties *not* specified in node_def get the base value)
local depleting_campfire = table.copy(campfire_base)
for k, v in pairs(node_def) do
  depleting_campfire [k] = v
end

core.register_node(mod_name..":campfire_depleting", depleting_campfire)



-- ** EXTINGUISHED ** CAMPFIRE
core.register_node(mod_name..":extinguished_campfire", {
  description = S("Extinguished campfire"),

  drawtype = "plantlike",
  waving = false,
  paramtype = "light",
  sunlight_propagates = true,

  tiles = {{
      name = "extinguished_campfire_animation.png", -- Your texture files
      animation = {
        type = "vertical_frames",       -- Stacked vertically
        aspect_w = 16,                  -- Width of one frame
        aspect_h = 16,                  -- Height of one frame (e.g., 16x16)
        length = 1,                   -- Duration per frame (seconds)
        -- For smoother blending, use multiple frames in a tall image
        -- length = 0.05, -- Faster animation
      }
    }},
  inventory_image = "extinguished_campfire.png",
  wield_image = "extinguished_campfire.png",
  use_texture_alpha = "blend",
  
  node_box = {
		type = "fixed",
		fixed = {-0.4, -0.38, -0.4, 0.4, -0.5, 0.4},
	},
    selection_box = {
		type = "fixed",
		fixed = {-0.4, -0.38, -0.4, 0.4, -0.5, 0.4},
	},

  sounds = soundlib.sand(),

  groups = { oddly_breakable_by_hand = 3, attached_node = 1, meta_based_drops = 1, },

  drop = mod_name..":ash"
  
})

core.register_node(mod_name..":ash_block", {
  description = S("Ash block"),
  groups = { ash = 1, solid = 1, suffocates = 1, falling_node = 1, crumbly = 1, },

  tiles = {"ash_block.png", "ash_block_side.png", },
  sounds = soundlib.sand(),
})

-------------============= ITEMS =============-------------

-- LOADED FIRESTARTER
core.register_craftitem(mod_name..":fire_striker_loaded", {
  description = S("Loadedfire striker"),
  inventory_image = "fire_striker_loaded.png",
  groups = {craftitem = 1, },
  stack_max = 1,
  on_use = function (itemstack, user, pointed_thing)
    if pointed_thing and pointed_thing.under and core.get_node(pointed_thing.under).name == mod_name..":sticks_pile" then
      core.set_node(pointed_thing.under, {name=mod_name..":campfire"})
      return (mod_name..":fire_striker")
    end
  end
})

-- FIRESTARTER
core.register_craftitem(mod_name..":fire_striker", {
  description = S("Fire striker \nNeeds tinder."),
  inventory_image = "fire_striker.png",
  groups = {craftitem = 1, },
  stack_max = 1,
})

-- TINDER
core.register_craftitem(mod_name..":tinder", {
  description = S("Tinder"),
  inventory_image = "tinder.png",
  groups = {craftitem = 1, tinder = 1, },
})

-- ASH
core.register_craftitem(mod_name..":ash", {
  description = S("Organic ash"),
  inventory_image = "ash.png",
  groups = {craftitem = 1, ash = 1, },
})

-- RESIN TORCH
core.register_craftitem(mod_name..":resin_torch", {
  description = S("Resin torch"),
  inventory_image = "resin_torch.png",
  groups = {craftitem = 1, torch = 1, },
})

-- RESIN TORCH
core.register_craftitem(mod_name..":resin_torch_lit", {
  description = S("Lit resin torch"),
  inventory_image = "resin_torch_lit.png",
  groups = {craftitem = 1, torch = 1, },
  stack_max = 1,
})

-------------============= CRAFTS =============-------------

core.register_craft({
  type = "shapeless",
  output = mod_name..":fire_striker",
  recipe = {
    "group:flint",
    "pebbles:pyrite"
  },
})

core.register_craft({
  type = "shapeless",
  output = mod_name..":fire_striker_loaded",
  recipe = {
    "group:flint",
    "pebbles:pyrite",
    "group:tinder"
  },
})

core.register_craft({
  type = "shapeless",
  output = mod_name..":fire_striker_loaded",
  recipe = {
    mod_name..":fire_striker",
    "group:tinder"
  },
})

core.register_craft({
  type = "shapeless",
  output = mod_name..":tinder",
  recipe = {
    "group:grass",
    "miscitems:wood_fibers"
  },
})

core.register_craft({
  type = "shaped",
  output = mod_name..":resin_torch",
  recipe = {
    {"miscitems:resin"},
    {"plants:stick"},
  },
})

core.register_craft({
  type = "shaped",
  output = mod_name..":ash_block",
  recipe = {
    {mod_name..":ash", mod_name..":ash", },
    {mod_name..":ash", mod_name..":ash", },
  },
})


-------------============= FUNCTIONS =============-------------



local handles = {}
local timer = 0

-- Parameters
local radius = 8 -- Flame node search radius around player
local cycle = 3 -- Cycle time for sound updates

-- Update sound for player
function fire.update_player_sound(player)
  local player_name = player:get_player_name()
  -- Search for flame nodes in radius around player
  local ppos = player:get_pos()
  local areamin = vector.subtract(ppos, radius)
  local areamax = vector.add(ppos, radius)
  local fpos, num = core.find_nodes_in_area(
    areamin,
    areamax,
    {"group:fire"}
  )
  -- Total number of flames in radius
  local flames = 0
  for k,v in pairs(num) do
    flames=flames+v
  end
  -- Stop previous sound
  if handles[player_name] then
    core.sound_stop(handles[player_name])
    handles[player_name] = nil
  end
  -- If flames
  if flames > 0 then
    -- Find centre of flame positions
    local fposmid = fpos[1]
    -- If more than 1 flame
    if #fpos > 1 then
      local fposmin = areamax
      local fposmax = areamin
      for i = 1, #fpos do
        local fposi = fpos[i]
        if fposi.x > fposmax.x then
          fposmax.x = fposi.x
        end
        if fposi.y > fposmax.y then
          fposmax.y = fposi.y
        end
        if fposi.z > fposmax.z then
          fposmax.z = fposi.z
        end
        if fposi.x < fposmin.x then
          fposmin.x = fposi.x
        end
        if fposi.y < fposmin.y then
          fposmin.y = fposi.y
        end
        if fposi.z < fposmin.z then
          fposmin.z = fposi.z
        end
      end
      fposmid = vector.divide(vector.add(fposmin, fposmax), 2)
    end
    -- Play sound
    local handle = core.sound_play("fire", {
      pos = fposmid,
      to_player = player_name,
      gain = math.min(0.2 * (1 + flames * 0.125), 1),
      max_hear_distance = 8,
      loop = true -- In case of lag
    })
    -- Store sound handle for this player
    if handle then
      handles[player_name] = handle
    end
  end
end

-- Cycle for updating players sounds
core.register_globalstep(function(dtime)
  timer = timer + dtime
  if timer < cycle then
    return
  end

  timer = 0
  local players = core.get_connected_players()
  for n = 1, #players do
    fire.update_player_sound(players[n])
  end
end)