local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

core.register_node("misc:tree_chop", {
    description = S("Tree-cutting air"),
    drawtype = "airlike",
    paramtype = "light",
    sunlight_propagates = true,

    walkable     = false,
    pointable    = false,
    diggable     = false,
    buildable_to = true,

    is_ground_content = false,
    groups = {solid = 0, suffocates = 0, air = 1, },
    tiles = {},
    sounds = {},
    drop = {},

    on_construct = function (pos)
        core.after(0.25, function ()
            -- destroy the node
            core.set_node(pos, {name="air"})
            
            -- replace the neighbor log nodes with
            local newpos

            newpos = {x=pos[1], y=pos[2]+1, z=pos[3]}
            if core.registered_nodes[core.get_node(newpos).name].groups["tree_chop"] then -- +y node
                drop_node(newpos, core.registered_nodes[core.get_node(newpos).name])
                core.set_node(newpos, {name="misc:tree_chop"})
            end

            newpos = {x=pos[1]+1, y=pos[2], z=pos[3]}
            if core.registered_nodes[core.get_node(newpos).name].groups["tree_chop"] then -- +x node
                drop_node(newpos, core.registered_nodes[core.get_node(newpos).name])
                core.set_node(newpos, {name="misc:tree_chop"})
            end
            newpos = {x=pos[1]-1, y=pos[2], z=pos[3]}
            if core.registered_nodes[core.get_node(newpos).name].groups["tree_chop"] then -- -x node
                drop_node(newpos, core.registered_nodes[core.get_node(newpos).name])
                core.set_node(newpos, {name="misc:tree_chop"})
            end

            newpos = {x=pos[1], y=pos[2], z=pos[3]+1}
            if core.registered_nodes[core.get_node(newpos).name].groups["tree_chop"] then -- +z node
                drop_node(newpos, core.registered_nodes[core.get_node(newpos).name])
                core.set_node(newpos, {name="misc:tree_chop"})
            end
            newpos = {x=pos[1], y=pos[2], z=pos[3]-1}
            if core.registered_nodes[core.get_node(newpos).name].groups["tree_chop"] then -- -z node
                drop_node(newpos, core.registered_nodes[core.get_node(newpos).name])
                core.set_node(newpos, {name="misc:tree_chop"})
            end

            newpos = {x=pos[1], y=pos[2]+1, z=pos[3]+1}
            if core.registered_nodes[core.get_node(newpos).name].groups["tree_chop"] then -- +z +y node
                drop_node(newpos, core.registered_nodes[core.get_node(newpos).name])
                core.set_node(newpos, {name="misc:tree_chop"})
            end
            newpos = {x=pos[1], y=pos[2]+1, z=pos[3]-1}
            if core.registered_nodes[core.get_node(newpos).name].groups["tree_chop"] then -- -z +y node
                drop_node(newpos, core.registered_nodes[core.get_node(newpos).name])
                core.set_node(newpos, {name="misc:tree_chop"})
            end

            newpos = {x=pos[1]+1, y=pos[2]+1, z=pos[3]}
            if core.registered_nodes[core.get_node(newpos).name].groups["tree_chop"] then -- +x +y node
                drop_node(newpos, core.registered_nodes[core.get_node(newpos).name])
                core.set_node(newpos, {name="misc:tree_chop"})
            end
            newpos = {x=pos[1]-1, y=pos[2]+1, z=pos[3]}
            if core.registered_nodes[core.get_node(newpos).name].groups["tree_chop"] then -- -x +y node
                drop_node(newpos, core.registered_nodes[core.get_node(newpos).name])
                core.set_node(newpos, {name="misc:tree_chop"})
            end

            newpos = {x=pos[1]+1, y=pos[2], z=pos[3]+1}
            if core.registered_nodes[core.get_node(newpos).name].groups["tree_chop"] then -- +x +z node
                drop_node(newpos, core.registered_nodes[core.get_node(newpos).name])
                core.set_node(newpos, {name="misc:tree_chop"})
            end
            newpos = {x=pos[1]+1, y=pos[2], z=pos[3]-1}
            if core.registered_nodes[core.get_node(newpos).name].groups["tree_chop"] then -- +x -z node
                drop_node(newpos, core.registered_nodes[core.get_node(newpos).name])
                core.set_node(newpos, {name="misc:tree_chop"})
            end

            newpos = {x=pos[1]-1, y=pos[2], z=pos[3]+1}
            if core.registered_nodes[core.get_node(newpos).name].groups["tree_chop"] then -- -x +z node
                drop_node(newpos, core.registered_nodes[core.get_node(newpos).name])
                core.set_node(newpos, {name="misc:tree_chop"})
            end
            newpos = {x=pos[1]-1, y=pos[2], z=pos[3]-1}
            if core.registered_nodes[core.get_node(newpos).name].groups["tree_chop"] then -- -x -z node
                drop_node(newpos, core.registered_nodes[core.get_node(newpos).name])
                core.set_node(newpos, {name="misc:tree_chop"})
            end



            newpos = {x=pos[1]+1, y=pos[2]+1, z=pos[3]+1}
            if core.registered_nodes[core.get_node(newpos).name].groups["tree_chop"] then -- +x +z +y node
                drop_node(newpos, core.registered_nodes[core.get_node(newpos).name])
                core.set_node(newpos, {name="misc:tree_chop"})
            end
            newpos = {x=pos[1]+1, y=pos[2]+1, z=pos[3]-1}
            if core.registered_nodes[core.get_node(newpos).name].groups["tree_chop"] then -- +x -z +y node
                drop_node(newpos, core.registered_nodes[core.get_node(newpos).name])
                core.set_node(newpos, {name="misc:tree_chop"})
            end

            newpos = {x=pos[1]-1, y=pos[2]+1, z=pos[3]+1}
            if core.registered_nodes[core.get_node(newpos).name].groups["tree_chop"] then -- -x +z +y node
                drop_node(newpos, core.registered_nodes[core.get_node(newpos).name])
                core.set_node(newpos, {name="misc:tree_chop"})
            end
            newpos = {x=pos[1]-1, y=pos[2]+1, z=pos[3]-1}
            if core.registered_nodes[core.get_node(newpos).name].groups["tree_chop"] then -- -x -z +y node
                drop_node(newpos, core.registered_nodes[core.get_node(newpos).name])
                core.set_node(newpos, {name="misc:tree_chop"})
            end
            
        end)
    end
})