-- imports
local Entity = require("entity")

-- file
local Projectile = Entity:New()
Projectile.__index = Projectile


function Projectile:New(x, y, speed)
    local this = Entity:New(x, y)

    this.speed = speed

    setmetatable(this, self)
    return this
end

function Projectile:Update(dt)
    local dy = -1
    self.dy = dy * self.speed

    Entity.Update(self, dt)
end

return Projectile
