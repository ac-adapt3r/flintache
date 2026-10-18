futils = {}

function can_harvest(nodename, toolname, player)
    local ndef = core.registered_nodes[nodename]

	if not ndef then
		return false
	end

    -- Check if it can be dug by tool
	local tdef = core.registered_items[toolname]

	if tdef and tdef.tool_capabilities and tdef.tool_capabilities.groupcaps then
		for g, gdef in pairs(tdef.tool_capabilities.groupcaps) do
			if ndef.groups[g] then
				if not gdef.level or ndef.groups[g] <= gdef.level then
					return true
				end
			end
		end
	end

	-- Check if it can be dug by hand
	if not player or not player:is_player() then return false end
	local name = player:get_inventory():get_stack("", 1):get_name()
	tdef = core.registered_items[name]
	if tdef then
		for g, gdef in pairs(tdef.tool_capabilities.groupcaps) do
			if ndef.groups[g] then
				if not gdef.level or ndef.groups[g] <= gdef.level then
					return true
				end
			end
		end
	end

	return false
end

local itemdrop = function(pos, item)
	-- itemstring to ItemStack for left:is_empty()
	local left = ItemStack(item)

	if not left:is_empty() then
		local p = vector.offset(pos,
			math.random()/2-0.25,
			math.random()/2-0.25,
			math.random()/2-0.25
		)
		core.add_item(p, left)
	end
end

futils.remove_and_update = function (pos)
		core.remove_node(pos)
    
		local directions = {
			{x = 0, y = 1, z = 0},
			{x = 0, y = -1, z = 0},
			{x = 1, y = 0, z = 0},
			{x = -1, y = 0, z = 0},
			{x = 0, y = 0, z = 1},
			{x = 0, y = 0, z = -1}
		}
		
		for _, dir in ipairs(directions) do
			local neighbor_pos = vector.add(pos, dir)
			core.check_for_falling(neighbor_pos)
			core.node_update(neighbor_pos)
		end
end

function core.handle_node_drops(pos, drops, digger)
    -- check tool's maximal drop level
    local dug_node = core.get_node(pos)
	local nodedef = core.registered_nodes[dug_node.name]
	local tooldef
	local tool

	if digger then
		tool = digger:get_wielded_item()
		tooldef = core.registered_craftitems[tool:get_name()] or core.registered_nodes[tool:get_name()]

		local has_stump = core.get_node(vector.add(pos, vector.new(0, -1, 0))).name == "plants:tree_stump"
		
		-- check if node and tool is strippable, if true will replace the node and give the strip drop
		if nodedef and tooldef and tooldef.groups["stripping"] and nodedef.groups["strippable"] then
			if digger:get_player_control().sneak or has_stump or not tooldef.groups["chopping"] then
				local dropitem
				if nodedef.strip_drop ~= nil then
					dropitem = nodedef.strip_drop
				else
					dropitem = nil
				end
	
				core.after(0.05, function ()
					core.swap_node({x=pos[1], y=pos[2], z=pos[3]}, {name=nodedef.strip_node, param2=dug_node.param2})
				end)
	
				if dropitem then
					itemdrop(pos, dropitem.." 1")
				end
				
				return
			end
		end

		-- check if node has chop stages or is a chopped node
		if nodedef and tooldef and can_harvest(dug_node.name, tool:get_name(), digger) and nodedef.groups["chopstages"] and has_stump  then
			local newnode

			if nodedef.chop_node then
				newnode = nodedef.chop_node
			else
				local before, number = nodedef.name:match("(.-)(%d*)$")
				number = tonumber(number) or 0
				
				newnode = before..(number + 1)
			end

			if core.registered_nodes[newnode] then
				core.after(0.05, function ()
					core.swap_node({x=pos[1], y=pos[2], z=pos[3]}, {name=newnode, param2=dug_node.param2})
				end)
			else
				core.set_node({x=pos[1], y=pos[2], z=pos[3]}, {name="misc:tree_chop"})
			end

			return
		end

		-- check if node and tool is shearsy, if true will give the shearsy drop
		if nodedef and tooldef and tooldef.groups["shearsytool"] and nodedef.groups["shearsy"] then
			local dropitem
			if nodedef.shearsy_drop ~= nil then
				dropitem = nodedef.shearsy_drop
			else
				dropitem = dug_node.name
			end
			itemdrop(pos, dropitem.." 1")
			return
		elseif nodedef and nodedef.groups["shearsy"] and nodedef.groups["boomshearsy"] then
			local damage = nodedef.boomDamage or 1

			digger:set_hp(digger:get_hp()-damage)
		end

		if not can_harvest(dug_node.name, tool:get_name(), digger) then
			return
		end
	end

	-- Add dropped items to object's inventory

	local inv = digger and digger:get_inventory()
	local give_item
	if inv and nodedef.groups.pickable then
		give_item = function(item)
			return inv:add_item("main", item)
		end
	else
		give_item = function(item)
			-- itemstring to ItemStack for left:is_empty()
			local append = ""
			if nodedef.groups and nodedef.groups["meta_based_drops"] == 1 then
				local meta = core.get_meta(pos)
				local amount = meta:get_int("drop_amount")
				append = " "..amount
			end
			local itemname
			if item.get_name then
				itemname = item:get_name()
			else
				itemname = item
			end
			return ItemStack(itemname..append)
		end
	end

	for _, dropped_item in pairs(drops) do
		local left = give_item(dropped_item)
		if not left:is_empty() then
			local p = vector.offset(pos,
				math.random()/2-0.25,
				math.random()/2-0.25,
				math.random()/2-0.25
			)
			core.add_item(p, left)
		end
	end
end


-- simulate drop
function drop_node(pos, def, digger)
	local node
	if not def then
		node = core.get_node(pos)
	else
		node = def
	end
	local drops = def.drop or core.registered_nodes[node.name].drop or {def.name}
	local inv

	if digger then
		inv = digger and digger:get_inventory()
	end
	local give_item

	if inv then
		give_item = function(item)
			return inv:add_item("main", item)
		end
	else
		give_item = function(item)
			-- itemstring to ItemStack for left:is_empty()
			return ItemStack(item)
		end
	end

	for _, dropped_item in pairs(drops) do
		local left = give_item(dropped_item)
		if not left:is_empty() then
			local p = vector.offset(pos,
				math.random()/2-0.25,
				math.random()/2-0.25,
				math.random()/2-0.25
			)
			core.add_item(p, left)
		end
	end
end