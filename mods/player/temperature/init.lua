local temperature = {}

-- Parameters
local radius = 12 -- heatsource node search radius around player
local cycle = 3 -- Cycle time for temperature updates

-- Update sound for player
function temperature.update_temperature(player)
  local player_name = player:get_player_name()
  -- Search for heatsource nodes in radius around player
  local ppos = player:get_pos()
  local areamin = vector.subtract(ppos, radius)
  local areamax = vector.add(ppos, radius)
  local fpos, num = core.find_nodes_in_area(
    areamin,
    areamax,
    {"group:heatsource"}
  )
  -- Total number of heat sources in radius
  local heatsources = 0
  for k,v in pairs(num) do
    heatsources=heatsources+v
  end

  local meta = player:get_meta()
  meta:set_float("own_temperature", heatsources)
end

local timer = 0
-- Cycle for updating players sounds
core.register_globalstep(function(dtime)
    timer = timer + dtime
    if timer < cycle then
      return
    end
  
    timer = 0
    local players = core.get_connected_players()
    for n = 1, #players do
      temperature.update_temperature(players[n])
    end
end)


local ambient_temperature = 0 -- later
core.register_chatcommand("temperature", {
    func = function(name)
        local player = core.get_player_by_name(name)
        local meta = player:get_meta()
        local own_temperature = meta:get_float("own_temperature")
        core.chat_send_player(name, own_temperature + ambient_temperature)
    end,
})