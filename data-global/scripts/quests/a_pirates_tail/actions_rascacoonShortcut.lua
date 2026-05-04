local rascacoonShortcut = Action()

function rascacoonShortcut.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player then
		return false
	end

	if player:isPzLocked() then
		fromPosition:sendMagicEffect(CONST_ME_POFF)
		return true
	end

	local position = Position({ x = 32941, y = 32031, z = 7 })
	player:teleportTo(position, true)
	position:sendMagicEffect(CONST_ME_TELEPORT)
	player:setDirection(DIRECTION_WEST)

	return true
end

rascacoonShortcut:position(Position({ x = 33774, y = 31348, z = 7 }))
rascacoonShortcut:register()