local Entity = require("entity")

local Enemy = Entity:New()
Enemy.__index = Enemy

function Enemy:New()
    local this = Entity:New(280, 100)

    this.x = 280
    this.y = 100
    this.width = 30
    this.height = 30
    this.type = "enemy"

    setmetatable(this, self)

    return this
end

function Enemy:Update()

end

function Enemy:Render()
    love.graphics.setColor(1, 0, 0) -- Red (RGB values from 0 to 1)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(0, 0, 0)
end

return Enemy
