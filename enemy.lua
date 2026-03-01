local Entity = require("entity")

local Enemy = Entity:New()
Enemy.__index = Enemy

function Enemy:New(x, y, color)
    local this = Entity:New(x, y)

    this.x = x
    this.y = y
    this.width = 30
    this.color = color
    this.height = 30
    this.type = "enemy"

    setmetatable(this, self)

    return this
end

function Enemy:Update()

end

-- function Enemy:Render()
--     love.graphics.setColor(self.color / 255, 0, 0) -- Red (RGB values from 0 to 1)
--     love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
--     love.graphics.setColor(0, 0, 0)
-- end

return Enemy
