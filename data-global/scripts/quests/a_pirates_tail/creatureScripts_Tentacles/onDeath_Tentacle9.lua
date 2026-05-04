local tentacle9_death = CreatureEvent("tentacle9_death")

local config = {
    line = {
        from = Position(33714, 31185, 6),
        to   = Position(33712, 31185, 6),
        itemId = 35126
    },
    monsterName = "Tentacle9",

    -- 🔄 tile final
    finalTile = {
        triggerPos = Position(33711, 31185, 6), -- donde se ve (35510)
        itemPos    = Position(33710, 31185, 6), -- tile real
        fromId = 35511,
        toId   = 35122 -- 👈 ahora correcto
    }
}

-- 🔥 obtener línea (soporta cualquier dirección)
local function getLinePositions()
    local positions = {}

    -- vertical
    if config.line.from.x == config.line.to.x then
        local step = config.line.from.y <= config.line.to.y and 1 or -1
        for y = config.line.from.y, config.line.to.y, step do
            table.insert(positions, Position(config.line.from.x, y, config.line.from.z))
        end

    -- horizontal
    elseif config.line.from.y == config.line.to.y then
        local step = config.line.from.x <= config.line.to.x and 1 or -1
        for x = config.line.from.x, config.line.to.x, step do
            table.insert(positions, Position(x, config.line.from.y, config.line.from.z))
        end
    end

    return positions
end

function tentacle9_death.onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
    local deathPos = creature:getPosition()
    local positions = getLinePositions()

    -- 🔎 índice actual
    local currentIndex = nil
    for i, pos in ipairs(positions) do
        if pos.x == deathPos.x and pos.y == deathPos.y and pos.z == deathPos.z then
            currentIndex = i
            break
        end
    end

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

        -- 👾 spawn siguiente tentacle
        local monster = Game.createMonster(config.monsterName, nextPos, true, true)
        if monster then
            nextPos:sendMagicEffect(CONST_ME_ENERGYHIT)
        end

    else
        -- 🏁 ÚLTIMO → remover visual + crear base
        -- 🔥 remover TODOS los 35510 del tile visual
        local visualTile = Tile(config.finalTile.triggerPos)
        if visualTile then
            local items = visualTile:getItems()
            if items then
                for _, item in ipairs(items) do
                    if item:getId() == config.finalTile.fromId then
                        item:remove()
                    end
                end
            end
        end

        -- 🔥 limpiar posibles duplicados del base
        local baseTile = Tile(config.finalTile.itemPos)
        if baseTile then
            local items = baseTile:getItems()
            if items then
                for _, item in ipairs(items) do
                    if item:getId() == config.finalTile.toId then
                        item:remove()
                    end
                end
            end
        end

        -- 🔄 crear limpio
        Game.createItem(config.finalTile.toId, 1, config.finalTile.itemPos)
    end

    return true
end

tentacle9_death:register()