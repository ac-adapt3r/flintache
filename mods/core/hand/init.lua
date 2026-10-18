

--  add hand tool
core.override_item("", {
	wield_scale = { x = 0, y = 0, z = 0},
    wield_image = "hand.png",

	tool_capabilities = {
		full_punch_interval = 0.5,
		groupcaps = {
            oddly_breakable_by_hand = {
                times = { 0.1, 0.5, 1, 3 },
                uses = 0,
                level = 3,
            },
--[[            cracky = {
                times = { 0.5, 0.8, 2 },
                uses = 0,
            },]]
            snappy = {
                times = {0.5, 0.8, 2},
                uses = 0,
                level = 3,
            },
            crumbly = {
                times = {1.5, 2, 3},
                uses = 0,
                level = 3,
            },
            instant = {
                times = {0, 0, 0},
                uses = 0,
                level = 3,
            },
            pickable = {
                times = {0, 0, 0},
                uses = 0,
                level = 3,
            },
        },
		damage_groups = { fleshy = 1 },
	},
})

-- modify inventory
core.register_on_joinplayer(function(player, last_login)
	core.after(0, player.hud_set_hotbar_itemcount, player, 8)
    core.after(0, player.hud_set_hotbar_image, player, "hotbar_image.png")
    core.after(0, player.hud_set_hotbar_selected_image, player, "hotbar_selected.png")
    --core.after(0, player.hud_set, player, "hotbar_selected.png")
    --local formspec = "size[4,5]list[current;main;0,0;4,1;]list[current;main;0,1;4,1;]"

    player:hud_add({
        hud_elem_type = "text",
        name = "hotbar_msg",
        position = {x = 0.5, y = 0.6}, -- Positions it near the hotbar
        size = {x = 1},
        text = "",
        alignment = {x = 0, y = 0},
        scale = {x = 100, y = 100},
        number = "0xFFFFFF",
    })
end)
