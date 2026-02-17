local Entity = require("entity")

local Projectile = Entity:New()
Projectile.__index = Projectile


function Projectile:New(x, y, speed)

end

function Projectile:Update(dt)

end

return Projectile
