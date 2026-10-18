core.register_on_joinplayer(function(player)
    core.after(0.1,function()
		player:set_properties({
            textures = {"player.png", "player_back.png"},
            visual = "upright_sprite",
            visual_size = {x = 0.8, y = 1.8},
            collisionbox = {-0.3, 0.0, -0.3, 0.3, 1.75, 0.3},
            stepheight = 0.6,
            eye_height = 1.625,
        })
	  end)

    player:set_physics_override({
      gravity = 1.65,
      jump = 1.4,
      speed = 1,
    })
    
    player:set_armor_groups({ fall_damage_add_percent = -9 })
end)
