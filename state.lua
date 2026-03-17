local State = {}
State.__index = State

function State:New()
    local this = {}

    setmetatable(this, self)
    return this
end

function State:Update(dt)
end

return State
