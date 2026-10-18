local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

local function shuffle(t)
    local j
    -- Start from the last element down to the second
    for i = #t, 2, -1 do
        -- Select a random index 'j' between 1 and 'i' (inclusive)
        j = math.random(i)
        -- Swap the elements at positions i and j
        t[i], t[j] = t[j], t[i]
    end
end


-- SPECIAL SAND
core.register_node(mod_name..":special_sand", {
    description = S("Special sand"),
    groups = { instant = 1, pickable = 1, },
    tiles = {"special_sand.png"},
    sounds = soundlib.pop(),
})

core.register_abm({
    nodenames = {mod_name..":special_sand"},
    interval = 1.0,
    --neighbors = {"air"},
    chance = 1,
    action = function(pos, node, active_object_count,
            active_object_count_wider)

        local me = {name = mod_name..":special_sand"}
        local pos = {x = pos.x, y = pos.y, z = pos.z}

        local bottom = {x = pos.x, y = pos.y - 1, z = pos.z}
        
        local  bnode = core.get_node(bottom).name
        if bnode == "air"
         or core.registered_nodes[bnode].buildable_to == true
         or bnode == mod_name..":special_water" then

            core.set_node(bottom, me)
            core.after(0.001, function()
                if bnode == mod_name..":special_water" then
                    core.set_node(pos, {name = bnode})
                else
                    core.set_node(pos, {name = "air"})
                end
            end)
            return
        end

        local checkpos = {
            {x = pos.x, y = pos.y - 1, z = pos.z-1},
            {x = pos.x, y = pos.y - 1, z = pos.z+1},
            {x = pos.x-1, y = pos.y - 1, z = pos.z},
            {x = pos.x+1, y = pos.y - 1, z = pos.z},
        }
        shuffle(checkpos)

        for _, p in pairs(checkpos) do
            local bnode = core.get_node(p).name
            if bnode == "air" or core.registered_nodes[bnode].buildable_to == true or bnode == mod_name..":special_water" then
                core.set_node(p, me)
                core.after(0.001, function()
                    if bnode == mod_name..":special_water" then
                        core.set_node(pos, {name = bnode})
                    else
                        core.set_node(pos, {name = "air"})
                    end
                end)
                return
            end
        end
    end
})


-- SPECIAL WATER
core.register_node(mod_name..":special_water", {
    description = S("Special water"),
    groups = { instant = 1, pickable = 1, },
    tiles = {{name="special_water.png^[opacity:150",
    backface_culling=false}},
    use_texture_alpha = "blend",
    paramtype = "light",
    drawtype = "glasslike_framed",
    waving = 3,

    sounds = soundlib.pop(),

    walkable = false,
    liquid_move_physics = true,
})

core.register_abm({
    nodenames = {mod_name..":special_water"},
    interval = 1.0,
    neighbors = {"air"},
    chance = 1,
    action = function(pos, node, active_object_count,
            active_object_count_wider)

        local me = {name = mod_name..":special_water"}
        local pos = {x = pos.x, y = pos.y, z = pos.z}

        local bottom = {x = pos.x, y = pos.y - 1, z = pos.z}
        
        if core.get_node(bottom).name == "air" or core.registered_nodes[core.get_node(bottom).name].buildable_to == true then
            core.set_node(bottom, me)
            core.after(0.001, function()
                core.set_node(pos, {name = "air"})
            end)
            return
        end

        local checkpos = {
            {x = pos.x, y = pos.y - 1, z = pos.z-1},
            {x = pos.x, y = pos.y - 1, z = pos.z+1},
            {x = pos.x-1, y = pos.y - 1, z = pos.z},
            {x = pos.x+1, y = pos.y - 1, z = pos.z},
        }
        shuffle(checkpos)

        for _, p in pairs(checkpos) do
            if core.get_node(p).name == "air" or core.registered_nodes[core.get_node(p).name].buildable_to == true then
                core.set_node(p, me)
                core.after(0.001, function()
                    core.set_node(pos, {name = "air"})
                end)
                return
            end
        end

        local wanderpos = {
            {x = pos.x, y = pos.y, z = pos.z-1},
            {x = pos.x, y = pos.y, z = pos.z+1},
            {x = pos.x-1, y = pos.y, z = pos.z},
            {x = pos.x+1, y = pos.y, z = pos.z},
        }
        shuffle(wanderpos)

        for _, p in pairs(wanderpos) do
            if core.get_node(p).name == "air" or core.registered_nodes[core.get_node(p).name].buildable_to == true then
                core.set_node(p, me)
                core.after(0.001, function()
                    core.set_node(pos, {name = "air"})
                end)
                return
            end
        end
    end
})