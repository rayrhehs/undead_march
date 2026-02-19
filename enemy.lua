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

function Enemy:Render()
    love.graphics.setColor(1, 0, 0) -- Red (RGB values from 0 to 1)
    love.graphics.rectangle("fill", 100, 100, 30, 30)
    love.graphics.setColor(0, 0, 0)
end

return Enemy
