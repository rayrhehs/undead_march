local Assets = require("assets")
local DebugMode = require("debugMode")

local Entity = {}
Entity.__index = Entity

function Entity:New(x, y, texture)
    local this = {
        x = x,
        y = y,
        dx = 0,
        dy = 0,
        texture = texture,
        scale = 1,
        width = 0,
        height = 0,
        offsetX = 0,
        offsetY = 0,
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
        love.graphics.draw(Assets.tileset, self.texture, self.x, self.y, self.angle, self.scale, self.scale, self
            .offsetX, self.offsetY)
    end

    -- enable debug mode hitbox rendering
    if DebugMode.showHitboxes then
        love.graphics.setColor(1, 0, 0)
        -- The hitbox should be drawn centered around (x, y)
        if self.offsetX ~= 0 or self.offsetY ~= 0 then
            love.graphics.rectangle("line", self.x - self.width / 2, self.y - self.height / 2, self.width, self.height)
        else
            love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
        end
        love.graphics.setColor(1, 1, 1)
    end
end

return Entity
