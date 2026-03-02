local Assets = require("assets")
local Enemy = require("enemy")

local EnemySpawner = {}

function EnemySpawner:SpawnGrid(entities)
    local rows = 5
    local cols = 11
    local gap = 5

    -- Calculate total grid dimensions
    -- Assuming each enemy sprite has a width/height (adjust these to match your actual sprite size)
    local enemyWidth = 12  -- Replace with your actual enemy sprite width
    local enemyHeight = 12 -- Replace with your actual enemy sprite height

    local gridWidth = (cols * enemyWidth) + ((cols - 1) * gap)
    local gridHeight = (rows * enemyHeight) + ((rows - 1) * gap)

    -- Center the grid on a 300x300 screen
    local screenWidth = 300
    local screenHeight = 300

    local startX = (screenWidth - gridWidth) / 2
    local startY = (screenHeight - gridHeight) / 2 - 50

    local currentX = startX
    local currentY = startY

    for i = 1, rows do
        local currentSprite = Assets.sprites.enemies[i]
        for b = 1, cols do
            local enemy = Enemy:New(currentX, currentY, currentSprite)
            table.insert(entities, enemy)
            currentX = currentX + enemyWidth + gap
        end
        currentX = startX
        currentY = currentY + enemyHeight + gap
    end
end

return EnemySpawner
