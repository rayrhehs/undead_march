local Entity = require("entity")

local Enemy = Entity:New()
Enemy.__index = Enemy

function Enemy:New(x, y, texture)
    local this = Entity:New(x, y, texture)

    this.x = x
    this.y = y
    this.width = 12
    this.height = 12
    this.type = "enemy"

    setmetatable(this, self)
    return this
end

function Enemy:Update()

end

return Enemy
