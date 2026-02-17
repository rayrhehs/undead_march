local Entity = require("entity")
local Projectile = require("projectile")

local Player = Entity:New()
Player.__index = Player

function Player:New(x, y, scale)
    local this = Entity:New(x, y)

    this.x = x
    this.y = y
    this.scale = scale
    this.speed = 400

    setmetatable(this, self)
    return this
end

function Player:Update(dt, entities)
    local dx = 0

    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        dx = dx - 1
    end

    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        dx = dx + 1
    end

    if love.keyboard.isDown("space") then
        local bullet = Projectile:New(self.x, self.y, 500)
        table.insert(entities, bullet) -- without this - the object is created and deleted immediatley
    end

    self.dx = dx * self.speed

    Entity.Update(self, dt)
end

return Player
