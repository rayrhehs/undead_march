-- imports
local Entity = require("entity")

-- file
local Projectile = Entity:New()
Projectile.__index = Projectile


function Projectile:New(x, y, speed)
    local this = Entity:New(x, y)

    this.width = 5
    this.height = 30
    this.speed = speed
    this.type = "projectile"

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

function Projectile:Render()
    love.graphics.setColor(1, 1, 1)
    -- if self.y <= 0 then
    --     love.graphics.printf("bullet destroyed", 0, 50, 400, "center")
    -- end
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(0, 0, 0)
end

return Projectile
