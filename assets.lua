local dir = love.filesystem.getSource()
-- IMAGES
image = {}
image.player = love.graphics.newImage(love.image.newImageData("/textures/ship.png"))
image.player2 = love.graphics.newImage(love.image.newImageData("/textures/ship2.png"))

image.background = love.graphics.newImage("/textures/bg.png")