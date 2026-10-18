local mod_name = core.get_current_modname()
local mod_path = core.get_modpath(mod_name)
local S = core.get_translator(mod_name)

-------------- functions ---------------

local function carve(itemstack, player, pointed_thing)
    local under = pointed_thing.under
    local above = pointed_thing.above
    local dir = core.dir_to_wallmounted(vector.direction(above, under))

    if core.get_node(above).name == "air" or (core.registered_nodes[core.get_node(above).name] and core.registered_nodes[core.get_node(above).name].buildable_to) then
        core.set_node(above, {name="building:carving_0", param2=dir})
        core.sound_play("carve", {pos = above, gain = 0.8})
    end
end

local function recarve (itemstack, player, pointed_thing)
    local pos = pointed_thing.under
    local node = core.get_node(pos)
    local nodedef = core.registered_nodes[node.name]

    local name = nodedef.name

    local before, number = name:match("(.-)(%d*)$")
    number = tonumber(number) or -1
    
    local newname = before..(number + 1)

    if core.registered_nodes[newname] then
        core.swap_node(pos, {name=newname, param2=node.param2})
    else
        core.swap_node(pos, {name=before.."0", param2=node.param2})
    end

    core.sound_play("carve", {pos = pos, gain = 0.8})
end

---------------- items -----------------

core.register_craftitem(mod_name..":flint_knife", {
    description = S("Flint knife \nUse on tree bark to create carvings"),
    inventory_image = "flint_knife.png",
    groups = {craftitem = 1, shearsytool = 1, tool = 1, stripping = 1, carvable = 1, knife = 1, },
    stack_max = 1,

    tool_capabilities = {
        full_punch_interval = 0.4,
        groupcaps = {
            snappy = {
                times = {0.1, 0.5, 1.5},
                uses = 1
            },
            strippable = {
                times = {3.5},
                uses = 0,
                level = 0
            },
        },
        damage_groups = { fleshy = 3 },
    },

    on_place = function (itemstack, player, pointed_thing)
        local groups = core.registered_nodes[core.get_node(pointed_thing.under).name].groups
        if groups and groups["carvable"] then
            carve(itemstack, player, pointed_thing)
        elseif groups and groups["carving"] then
            recarve(itemstack, player, pointed_thing)
        end
    end,
})


core.register_craftitem(mod_name..":flint_axe", {
    description = S("Flint axe"),
    inventory_image = "flint_axe.png",
    groups = {craftitem = 1, tool = 1, stripping = 1, chopping = 1, axe = 1, },
    stack_max = 1,

    tool_capabilities = {
        full_punch_interval = 0.4,
        groupcaps = {
            snappy = {
                times = {0.1, 0.5, 1.5},
                uses = 1
            },
            strippable = {
                times = {3.5},
                uses = 0,
                level = 0
            },
            choppy = {
                times = {2.1},
                uses = 1,
                level = 1
            }
        },
        damage_groups = { fleshy = 2 },
    },
})


core.register_craftitem(mod_name..":flint_pickaxe", {
    description = S("Flint pickaxe"),
    inventory_image = "flint_pickaxe.png",
    groups = {craftitem = 1, tool = 1, pickaxe = 1, },
    stack_max = 1,

    tool_capabilities = {
        full_punch_interval = 0.4,
        groupcaps = {
            snappy = {
                times = {0.1, 0.5, 1.5},
                uses = 1
            },
            crumbly = {
                times = {0.8, 1, 1.2},
                uses = 0,
                level = 3
            },
            cracky = {
                times = {4},
                uses = 0,
                level = 1,
            },
        },
        damage_groups = { fleshy = 2 },
    },
})

--------------- crafts -----------------

core.register_craft({
    type = "shaped",
    output = mod_name..":flint_knife 1",
    recipe = {
        {"flint:knife_head_flint", "miscitems:wood_fibers"},
        {"group:stick", ""},
    },
})

core.register_craft({
    type = "shaped",
    output = mod_name..":flint_axe 1",
    recipe = {
        {"flint:axe_head_flint", "miscitems:wood_fibers"},
        {"group:stick", ""},
    },
})

core.register_craft({
    type = "shaped",
    output = mod_name..":flint_pickaxe 1",
    recipe = {
        {"flint:pickaxe_head_flint", "miscitems:wood_fibers"},
        {"group:stick", ""},
    },
})


----====== ADMIN TOOL ======----

core.register_craftitem(mod_name..":admin_tool", {
    description = S("Admin Tool"),
    inventory_image = {
        name = "dog.png",
        animation = {
          type = "vertical_frames",
          aspect_w = 100,
          aspect_h = 100,
          length = 05.46,
        },
    },
    groups = {craftitem = 1, },
    stack_max = 1,

    on_use = function (itemstack, user, pointed_thing)
        if pointed_thing.type ~= "node" then
            if pointed_thing.type == "object" then
                pointed_thing.ref:remove()
            end
            return
        end

        local under = pointed_thing.under
        local node = core.get_node(under)

        if node ~= nil and node.name ~= "air" then
            core.set_node(under, {name="air"})
            core.add_item(under, ItemStack(node.name))
        end
    end,

    on_place = function(itemstack, placer, pointed_thing)
        if pointed_thing.type ~= "node" then
            core.item_place(itemstack, placer, pointed_thing)
            return
        end

        local above = pointed_thing.above
        local node = core.get_node(above)

        if node ~= nil and node.name ~= "air" then
            core.set_node(above, {name="air"})
            core.add_item(above, ItemStack(node.name))
        end
    end,
})