local Assets = require("assets")
local Enemy = require("enemy")

local EnemySpawner = {}

function EnemySpawner:SpawnGrid(entities)
    local rows = 5
    local cols = 11
    local startX = 100
    local startY = 100
    local enemySize = 30
    local gap = 10

    local currentX = startX
    local currentY = startY

    for i = 1, rows do
        local currentSprite = Assets.sprites.enemies[i]
        for b = 1, cols do
            local enemy = Enemy:New(currentX, currentY, currentSprite)
            table.insert(entities, enemy)
            currentX = currentX + enemySize + gap
        end
        currentX = startX
        currentY = currentY + enemySize + gap
    end
end

return EnemySpawner
