-- store in global memory space = every other file can access
local Player = require("player")

World = {
    player = nil
}

local entities = {}

function love.load()
    World.player = Player:New(280, 500, 1)
    table.insert(entities, World.player)
end

function love.update(dt)
    love.window.setTitle("Undead March")
    for i, v in ipairs(entities) do
        v:Update(dt)
    end
end

function love.draw()
    for i, v in ipairs(entities) do
        v:Render()
    end
end
