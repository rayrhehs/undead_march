local Assets = require("assets")
local Entity = require("entity")
local Projectile = require("projectile")
local Timer = require("timer")

local Player = Entity:New()
Player.__index = Player

function Player:New(x, y)
    local this = Entity:New(x, y, Assets.sprites.player)

    this.x = x
    this.y = y
    this.hitboxWidth = 12
    this.hitboxHeight = 12
    this.speed = 150
    this.shootTimer = Timer:New(1, true)
    this.type = "player"


    setmetatable(this, self)
    return this
end

function Player:Update(dt, entities)
    self.shootTimer:Update(dt) -- run instance of timer we created in player update

    local dx = 0

    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        dx = dx - 1
    end

    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        dx = dx + 1
    end

    if love.keyboard.isDown("space") and self.shootTimer.finished then
        local bullet = Projectile:New(self.x, self.y - 8) -- y - 8 is the offset above the player
        table.insert(entities, bullet)                    -- without this the object is created and immed. deleted by garbage collector
        self.shootTimer:Reset()
    end

    self.dx = dx * self.speed

    Entity.Update(self, dt) -- could i also do Entity:Update(dt)??
end

return Player
