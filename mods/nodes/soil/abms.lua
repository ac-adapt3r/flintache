
-- CHANGE DIRT TO GRASS WHEN NEAR GRASS
core.register_abm({
    nodenames = {"group:spreads_to_dirt"},
    neighbors = {"group:grass_can_grow"},
    interval = 25.0,
    chance = 5,
    action = function(pos, node, active_object_count, active_object_count_wider)
        local nodes = core.find_nodes_in_area_under_air(
            vector.offset(pos, -1, -1, -1),
            vector.offset(pos,  1,  1,  1),
            {"group:grass_can_grow"})
        local spread_pos = nil
        for index, value in pairs(nodes) do
            spread_pos = value
            break
        end
        if not spread_pos then
            return
        end
        core.set_node(spread_pos, {name = node.name})
    end
})

-- CHANGE GRASS TO DIRT WHEN SUFFOCATED BY SOLID BLOCK ABOVE
core.register_abm({
    nodenames = {"soil:grass"},
    neighbors = {"group:solid"},
    interval = 25.0,
    chance = 5,
    action = function(pos, node, active_object_count, active_object_count_wider)
        if core.get_item_group(core.get_node(vector.offset(pos, 0, 1, 0)).name, "solid") ~= 0 then
            core.set_node(pos, {name = "soil:dirt"})
        end
    end
})
