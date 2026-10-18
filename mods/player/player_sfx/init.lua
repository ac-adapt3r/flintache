core.register_on_item_pickup(function(itemstack, player, pointed_thing, time_from_last_punch)
    local handle = core.sound_play("pickup", {
      --pos = vector.add(player:get_pos(), {x=0, y=0.8, z=0}),
      to_player = player:get_player_name(),
      gain = 0.6,
      pitch = 1.5,
      max_hear_distance = 8,
      loop = false
    })
  end)