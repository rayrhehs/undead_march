local Assets = {
    tileset = nil,
    sprites = {},
}

function Assets:Load()
    self.tileset = love.graphics.newImage("tileset.png")

    local function createQuadFromTileset(x, y, w, h)
        local tileSize = 12
        local spacing = 1
        local margin = 1
        return love.graphics.newQuad(
            margin + x * (tileSize + spacing),
            margin + y * (tileSize + spacing),
            w * tileSize,
            h * tileSize,
            self.tileset:getDimensions()
        )
    end

    self.sprites = {
        player = createQuadFromTileset(132, 40, 1, 1),
        projectile = createQuadFromTileset(101, 25, 1, 1),
        enemies = {
            createQuadFromTileset(110, 41, 1, 1),
            createQuadFromTileset(111, 41, 1, 1),
            createQuadFromTileset(112, 41, 1, 1),
            createQuadFromTileset(113, 41, 1, 1),
            createQuadFromTileset(114, 41, 1, 1)
        }
    }
end

return Assets
