local State = require("state")
local Timer = require("timer")

local EnemyState = State:New()
EnemyState.__index = EnemyState

function EnemyState:New()
    local this = State:New()

    this.direction = 1
    this.shouldReverse = false
    this.timer = Timer:New(2, false)

    setmetatable(this, self)
    return this
end

function EnemyState:Update(dt)
    if self.timer.finished then
        self.timer:Reset()
    end

    if self.shouldReverse then
        self.direction = self.direction * -1
        self.shouldReverse = false
    end

    self.timer:Update(dt)
end

return EnemyState
