soundlib = {}

function soundlib.leaves(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "leaves_dig", gain = 0.3}
	tbl.dug = tbl.dug or
			{name = "leaves_dug", gain = 0.6}
	tbl.place = tbl.place or
			{name = "leaves_dig", gain = 0.4}
	tbl.dig = tbl.dig or
			{name = "leaves_dig", gain = 0.6}
	return tbl
end

function soundlib.grass(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "grass_rustle", gain = 1.0}
	tbl.dug = tbl.dug or
			{name = "grass_dig", gain = 0.6, pitch = 1.5}
	tbl.place = tbl.place or
			{name = "grass_dig", gain = 0.6, pitch = 1.4}
	tbl.dig = tbl.dig or
			{name = "grass_dig", gain = 0.6}
	return tbl
end

function soundlib.stone(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "stone", gain = 0.3}
	tbl.dug = tbl.dug or
			{name = "stone", gain = 0.3, pitch = 1.3}
	tbl.place = tbl.place or
			{name = "stone", gain = 0.3, pitch = 1.2}
	tbl.dig = tbl.dig or
			{name = "stone", gain = 0.3, pitch = 1.1}
	return tbl
end

function soundlib.wood(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "stone", gain = 0.3}
	tbl.dug = tbl.dug or
			{name = "stone", gain = 0.3, pitch = 1.3}
	tbl.place = tbl.place or
			{name = "stone", gain = 0.3, pitch = 1.2}
	tbl.dig = tbl.dig or
			{name = "stone", gain = 0.3, pitch = 1.1}
	return tbl
end

function soundlib.gravel(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "gravel", gain = 0.8}
	tbl.dug = tbl.dug or
			{name = "gravel", gain = 0.8}
	tbl.place = tbl.place or
			{name = "gravel", gain = 0.8}
	tbl.dig = tbl.dig or
			{name = "gravel", gain = 0.8}
	return tbl
end

function soundlib.soil(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "soil", gain = 0.3, pitch = 1.08}
	tbl.dug = tbl.dug or
			{name = "soil", gain = 0.5, pitch = 1.5}
	tbl.place = tbl.place or
			{name = "soil", gain = 0.5, pitch = 1.4}
	tbl.dig = tbl.dig or
			{name = "soil", gain = 0.4}
	return tbl
end

function soundlib.sand(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "sand", gain = 0.3, pitch = 1.08}
	tbl.dug = tbl.dug or
			{name = "sand_dug", gain = 0.4, pitch = 1.6}
	tbl.place = tbl.place or
			{name = "sand", gain = 0.35, pitch = 1.5}
	tbl.dig = tbl.dig or
			{name = "sand_dig", gain = 0.4, pitch = 1.08}
	return tbl
end

function soundlib.water(tbl)
	tbl = tbl or {}
	tbl.footstep = tbl.footstep or
			{name = "water", gain = 0.4, pitch = 0.9}
	tbl.dug = tbl.dug or
			{name = "water", gain = 1, pitch = 1}
	tbl.place = tbl.place or
			{name = "water", gain = 1, pitch = 1.}
	tbl.dig = tbl.dig or
			{name = "water", gain = 1, pitch = 1}
	return tbl
end

function soundlib.pop(tbl)
	tbl = tbl or {}
	tbl.dug = tbl.dug or
			{name="pop", gain=0.1, pitch = 0.5}
	tbl.place = tbl.place or
			{name="pop", gain=0.1, pitch = 0.7}
	return tbl
end

function soundlib.pebble(tbl)
	tbl = tbl or {}
	tbl.dug = tbl.dug or
			{name = "stone", gain = 0.3, pitch = 1.3}
	tbl.place = tbl.place or
			{name = "stone", gain = 0.3, pitch = 1.2}
	tbl.dig = tbl.dig or
			{name = "stone", gain = 0.3, pitch = 1.1}
	return tbl
end