-- imports
local Assets = require("assets")
local Entity = require("entity")

-- file
local Projectile = Entity:New()
Projectile.__index = Projectile


function Projectile:New(x, y)
    local this = Entity:New(x, y, Assets.sprites.projectile)

    this.hitboxWidth = 4
    this.hitboxHeight = 12
    this.speed = 300
    this.type = "projectile"

    setmetatable(this, self)
    return this
end

function Projectile:CheckCollision(other)
    -- call hitbox inside of check collision
    local sx, sy, sw, sh = self:GetHitbox()
    local ox, oy, ow, oh = other:GetHitbox()

    return sx < ox + ow and
        ox < sx + sw and
        sy < oy + oh and
        oy < sy + sh
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
