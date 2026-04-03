local Entity = require("entity")

local Enemy = Entity:New()
Enemy.__index = Enemy

function Enemy:New(x, y, texture, enemyState)
    local this = Entity:New(x, y, texture)

    this.x = x
    this.y = y
    this.hitboxWidth = 12
    this.hitboxHeight = 12
    this.moveDistance = 12
    this.type = "enemy"
    this.enemyState = enemyState

    setmetatable(this, self)
    return this
end

function Enemy:MoveEnemy()
    if (self.x > 250 and self.enemyState.direction == 1) or (self.x < 50 and self.enemyState.direction == -1) then
        self.enemyState.shouldReverse = true
    end

    if self.enemyState.moveDown == 0 then
        self.x = self.x + self.moveDistance * self.enemyState.direction
    end
    self.y = self.y + (self.moveDistance + 5) * self.enemyState.moveDown
end

function Enemy:Update()
    if self.enemyState.timer.finished then
        self:MoveEnemy()
    end
end

-- old enemy shape
-- function Enemy:Render()
--     love.graphics.setColor(self.color / 255, 0, 0) -- Red (RGB values from 0 to 1)
--     love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
--     love.graphics.setColor(0, 0, 0)
-- end

return Enemy
