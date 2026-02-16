Entity = {}
Entity.__index = Entity

function Entity:New(x, y)
    local this = {
        x = x,
        y = y,
        dx = 0,
        dy = 0,
        texture = nil,
        scale = 1,
        width = 0,
        height = 0,
    }

    setmetatable(this, self)
    return this
end

function Entity:Update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Entity:Render()
    -- if self.texture then
    --     love.graphics.draw(self.texture, self.x, self.y, self.angle, self.scale, self.scale, self.width / 2,
    --         self.height / 2)
    -- end

    love.graphics.rectangle("fill", self.x, self.y, 30, 30)
end
