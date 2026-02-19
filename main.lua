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
        if v == World.player then
            v:Update(dt, entities)
        else
            v:Update(dt)
        end
    end
end

function love.draw()
    for i, v in ipairs(entities) do
        v:Render()
    end
    World.enemy:Render()
    World.player:Render()
end
