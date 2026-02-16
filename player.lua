Player = Entity:New()
Player.__index = Player

function Player:New(x, y, scale)
    local this = Entity:New(x, y)

    this.x = x
    this.y = y
    this.scale = scale
    this.speed = 400

    setmetatable(this, self)
    return this
end

function Player:Update(dt)
    local dx = 0

    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        dx = dx - 1
    end

    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        dx = dx + 1
    end

    self.dx = dx * self.speed

    Entity.Update(self, dt)
end
