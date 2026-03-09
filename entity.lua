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
        hitboxWidth = 0,
        hitboxHeight = 0,
        dead = false,
        type = nil,
        angle = 0
    }

    setmetatable(this, self)
    return this
end

function Entity:GetHitbox()
    local spriteWidth = 0
    local spriteHeight = 0

    if self.texture then
        local x, y, w, h = self.texture:getViewport() -- retrieves x, y, w, h of quad within tileset
        spriteWidth = w
        spriteHeight = h
    end

    local ox = (spriteWidth - self.hitboxWidth) / 2
    local oy = (spriteHeight - self.hitboxHeight) / 2
    return self.x + ox, self.y + oy, self.hitboxWidth, self.hitboxHeight
end

function Entity:Update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Entity:Render()
    if self.texture then
        love.graphics.draw(Assets.tileset, self.texture, self.x, self.y, self.angle, self.scale, self.scale)
    end

    -- enable debug mode hitbox rendering
    if DebugMode.showHitboxes then
        love.graphics.setColor(1, 0, 0)
        local hx, hy, hw, hh = self:GetHitbox()
        love.graphics.rectangle("line", hx, hy, hw, hh)
        love.graphics.setColor(1, 1, 1)
    end
end

return Entity
