-- store in global memory space = every other file can access
local Player = require("player")
local Enemy = require("enemy")

World = {
    player = nil
}

local entities = {}

function love.load()
    World.player = Player:New(280, 500, 1)
    World.enemy = Enemy:New()
    table.insert(entities, World.player)
    table.insert(entities, World.enemy)
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

    for i = #entities, 1, -1 do
        if entities[i].dead then
            table.remove(entities, i) -- .remove(table, position)
        end
    end
end
