-- register extra flavours of a base nodedef
local timer = 0
local oldloc
core.register_globalstep(function(dtime)
	timer = timer + dtime;
	if timer >= 0.25 then
		for _,player in pairs(core.get_connected_players()) do
            local loc = vector.add(vector.round(player:get_pos()),{x=0,y=0,z=0})
            if loc ~= nil then
               
                local nodeiamon = core.get_node(loc)
                if nodeiamon ~= nil then
                    local def = core.registered_nodes[nodeiamon.name]
                    if def ~= nil and def.on_walk_over ~= nil then
                        def.on_walk_over(loc, nodeiamon, player)
                    end
                end
            end

            if oldloc ~= nil and oldloc ~= loc then
                local oldnodeiamon = core.get_node(oldloc)
                if oldnodeiamon ~= nil then
                    local def = core.registered_nodes[oldnodeiamon.name]
                    if def ~= nil and def.on_walk_over_end ~= nil then
                        def.on_walk_over_end(oldloc, oldnodeiamon, player)

                    end
                end
            end

            oldloc = loc
        end
	 
		timer = 0
	end
end)