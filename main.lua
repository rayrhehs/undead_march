-- store in global memory space = every other file can access
local Assets = require("assets")
local Player = require("player")
local EnemySpawner = require("enemySpawner")

World = {
    player = nil
}

local entities = {}

-- local enemyX = 100
-- local enemyY = 100
-- local enemySize = 30
-- local enemyGap = 10

function love.load()
    Assets:Load()

    World.player = Player:New(280, 500)
    table.insert(entities, World.player)

    -- create enemies in rows and columns
    EnemySpawner:SpawnGrid(entities)
end

function love.update(dt)
    love.window.setTitle("Undead March")

    for i, v in ipairs(entities) do
        v:Update(dt, entities)
    end
end

function love.draw()
    for i, v in ipairs(entities) do
        v:Render()
    end

    -- removes enemies that have the tag .dead = true
    for i = #entities, 1, -1 do
        if entities[i].dead then
            table.remove(entities, i) -- .remove(table, position)
        end
    end
end
