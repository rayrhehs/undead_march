local Entity = require("entity")

local Enemy = Entity:New()
Enemy.__index = Enemy

function Enemy:New()
    local this = {}

    setmetatable(this, self)

    return this
end

function Enemy:Update()

end

return Enemy
