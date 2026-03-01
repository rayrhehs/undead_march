local Assets = require("assets")

local Entity = {}
Entity.__index = Entity

function Entity:New(x, y, texture)
    local this = {
        x = x,
        y = y,
        dx = 0,
        dy = 0,
        texture = texture,
        scale = 4,
        width = 0,
        height = 0,
        dead = false,
        type = nil,
        angle = 0
    }

    setmetatable(this, self)
    return this
end

function Entity:Update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Entity:Render()
    if self.texture then
        love.graphics.draw(Assets.tileset, self.texture, self.x, self.y, self.angle, self.scale, self.scale)
    end

    -- love.graphics.rectangle("fill", self.x, sef.y, 30, 30)
end

return Entity
