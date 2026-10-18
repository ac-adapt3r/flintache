local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

local plants = {}

-- Parameters
local radius = 10 -- Flame node search radius around player
local boomradius = 8
local cycle = 1 -- Cycle time for sound updates

local cyclenum = 1
local oldpos

function plants.heartkeeper_heal(plr)
    if cyclenum%4 < 3 then
        return
    end

    local pos = plr:get_pos()
    local node = core.get_node({x=pos.x, y=pos.y, z=pos.z}) 

    if node and node.name == mod_name..":heartkeeper" then
        local oldhp = plr:get_hp()
        plr:set_hp(plr:get_hp() + 1)

        -- run only if actually healed
        if plr:get_hp() ~= oldhp then
            -- set metadata
            local meta = core.get_meta({x=pos.x, y=pos.y, z=pos.z})
            local healenergy = meta:get_int("healenergy")

            if healenergy ~= 0 then
                meta:set_int("healenergy", healenergy-1)
            else
                meta:set_int("healenergy", 10)
            end

            local sound = "heartkeeper_heal"
            if meta:get_int("healenergy") <= 1 then
                core.set_node({x=pos.x, y=pos.y, z=pos.z}, {name=mod_name..":withered_heartkeeper"})
                sound = "heartkeeper_heal_last"
            end

            -- Play sound
            local handle = core.sound_play(sound, {
                pos = {x=pos.x, y=pos.y, z=pos.z},
                to_player = plr:get_player_name(),
                gain = 0.05,
                max_hear_distance = 8,
                loop = false
                }) 
        end
    end
end

local handles = {}
local timer = 0

-- Update sound for player
function plants.quiet_bangle(player)
  local player_name = player:get_player_name()
  -- Search for flame nodes in radius around player
  local ppos = player:get_pos()
  local areamin = vector.subtract(ppos, radius)
  local areamax = vector.add(ppos, radius)
  local fpos, num = core.find_nodes_in_area(
    areamin,
    areamax,
    {mod_name..":quiet_bangle"}
  )
  -- Total number of flames in radius
  local flames = (num[mod_name..":quiet_bangle"] or 0)
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

    local dx = ppos[1] - fposmid.x
    local dy = ppos[2] - fposmid.y
    local dz = ppos[3] - fposmid.z
    -- math.sqrt calculates the square root of the sum of the squared differences
    local distance = math.sqrt(dx * dx + dy * dy + dz * dz)

    if distance <= boomradius then
        if oldpos and ppos and math.abs((oldpos[1] - ppos[1]) + (oldpos[3] - ppos[3])) > 1  then
            player:set_hp(player:get_hp() - 6*#fpos)
            for i in pairs(fpos) do
                core.set_node(fpos[i], {name="air"})
            end
            -- Play burst sound
            local handle = core.sound_play("quiet_bangle_burst", {
                pos = fposmid,
                to_player = player_name,
                gain = math.min(0.2 * (1 + flames * 0.125), 1),
                max_hear_distance = 32,
                loop = false
            })

            return
        end
    end

    if cyclenum%4 < 3 then
        return
    else
        -- Stop previous sound
        if handles[player_name] then
            core.sound_stop(handles[player_name])
            handles[player_name] = nil
        end
        -- Play passive sound
        local handle = core.sound_play("quiet_bangle", {
        pos = fposmid,
        to_player = player_name,
        gain = math.min(0.2 * (1 + flames * 0.125), 1),
        max_hear_distance = 32,
        loop = false
        })
        -- Store sound handle for this player
        if handle then
        handles[player_name] = handle
        end
    end
  end
  oldpos = ppos
end


core.register_globalstep(function(dtime)
    timer = timer + dtime
    if timer < cycle then
      return
    end
  
    timer = 0
    local players = core.get_connected_players()
    for n = 1, #players do
        plants.heartkeeper_heal(players[n])
        plants.quiet_bangle(players[n])
    end
    cyclenum = cyclenum + 1
  end)