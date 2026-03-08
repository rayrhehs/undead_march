local Assets = require("assets")
local Entity = require("entity")


local Projectile = Entity:New()
Projectile.__index = Projectile


function Projectile:New(x, y)
    local this = Entity:New(x, y, Assets.sprites.projectile)

    this.width = 4
    this.height = 12
    this.speed = 300
    this.type = "projectile"

    this.offsetX = 6
    this.offsetY = 6

    setmetatable(this, self)
    return this
end

function Projectile:CheckCollision(other)
    return self.x < other.x + other.width and
        other.x < self.x + self.width and
        self.y < other.y + other.height and
        other.y < self.y + self.height
end

function Projectile:Update(dt, entities)
    local dy = -1
    self.dy = dy * self.speed

    -- destroys bullet
    for i, entity in ipairs(entities) do
        if entity.type ~= "player" and entity ~= self and self:CheckCollision(entity) then
            self.dead = true
            entity.dead = true
        end
    end

    -- destroys bullet if above boundary
    if self.y <= 0 then
        self.dead = true
    end

    Entity.Update(self, dt)
end

return Projectile
