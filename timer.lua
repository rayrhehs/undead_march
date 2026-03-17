local Timer = {}
Timer.__index = Timer

function Timer:New(duration, state)
    local this = {
        duration = duration,
        time = 0,
        finished = state
    }

    setmetatable(this, self)

    return this
end

function Timer:Update(dt)
    if self.finished then return end

    self.time = self.time + dt
    if self.time >= self.duration then
        self.finished = true
    end
end

function Timer:Reset()
    self.time = 0
    self.finished = false
end

return Timer
