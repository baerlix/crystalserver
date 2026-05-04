local tentacle8_death = CreatureEvent("tentacle8_death")

local config = {
    line = {
        from = Position(33718, 31187, 6),
        to   = Position(33718, 31190, 6),
        itemId = 35112
    },
    monsterName = "Tentacle8",

    -- 🔄 tile final a revertir
    finalTile = {
        position = Position(33718, 31191, 6),
        fromId = 35109,
        toId   = 35110
    }
}

-- 🔍 obtener posiciones de la línea
local function getLinePositions()
    local positions = {}

    for x = config.line.from.x, config.line.to.x do
        for y = config.line.from.y, config.line.to.y do
            table.insert(positions, Position(x, y, config.line.from.z))
        end
    end

    return positions
end

function tentacle8_death.onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
    local deathPos = creature:getPosition()
    local positions = getLinePositions()

    -- 🔎 encontrar índice actual
    local currentIndex = nil
    for i, pos in ipairs(positions) do
        if pos.x == deathPos.x and pos.y == deathPos.y and pos.z == deathPos.z then
            currentIndex = i
            break
        end
    end

    -- si murió en la inicial (fuera de línea)
    if not currentIndex then
        currentIndex = 0
    end

    local nextIndex = currentIndex + 1
    local nextPos = positions[nextIndex]

    if nextPos then
        -- 🔥 remover item del siguiente tile
        local tile = Tile(nextPos)
        if tile then
            local item = tile:getItemById(config.line.itemId)
            if item then
                item:remove()
            end
        end

        -- 👾 spawnear siguiente tentacle
        local monster = Game.createMonster(config.monsterName, nextPos, true, true)
        if monster then
            nextPos:sendMagicEffect(CONST_ME_ENERGYHIT)
        end
    else
        -- 🏁 ÚLTIMO → revertir tile final
        local tile = Tile(config.finalTile.position)
        if tile then
            local item = tile:getItemById(config.finalTile.fromId)
            if item then
                item:transform(config.finalTile.toId)
            end
        end
    end

    return true
end

tentacle8_death:register()