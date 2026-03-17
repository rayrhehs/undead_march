-- store in global memory space = every other file can access
local Assets = require("assets")
local Player = require("player")
local EnemySpawner = require("enemySpawner")
local EnemyState = require("enemyState")
local DebugMode = require("debugMode")
local Push = require("lib.push")

World = {
    player = nil,
    enemyState = nil
}

local entities = {}
local states = {}

WINDOW_WIDTH, WINDOW_HEIGHT = love.window.getDesktopDimensions()
WINDOW_WIDTH, WINDOW_HEIGHT = WINDOW_WIDTH * 0.8, WINDOW_HEIGHT * 0.8

VIRTUAL_WIDTH, VIRTUAL_HEIGHT = 300, 300

function love.keypressed(key)
    if key == "f2" then
        DebugMode.showHitboxes = not DebugMode.showHitboxes
    end
end

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, { fullscreen = false, vsync = true })

    Assets:Load()

    World.enemyState = EnemyState:New()
    table.insert(states, World.enemyState)

    World.player = Player:New(150, 250)
    table.insert(entities, World.player)

    -- create enemies in rows and columns
    EnemySpawner:SpawnGrid(entities, World.enemyState)
end

function love.update(dt)
    love.window.setTitle("Undead March")

    for b, w in ipairs(states) do
        w:Update(dt, states)
    end

    for i, v in ipairs(entities) do
        v:Update(dt, entities)
    end
end

function love.resize(w, h)
    Push:resize(w, h)
end

function love.draw()
    Push:start()
    for i, v in ipairs(entities) do
        v:Render()
    end

    -- removes enemies that have the tag .dead = true
    for i = #entities, 1, -1 do
        if entities[i].dead then
            table.remove(entities, i) -- .remove(table, position)
        end
    end
    Push:finish()
end
