require("map")
require("physics")
require("entity")
require("assets")
require("player")

local x, y = 0
function love.load()
end


function love.update()

    -- SHUTDOWN CHECK
    if(love.keyboard.isDown('escape'))then
        love.event.quit(true)
    end
    -- SHUTDOWN CHECK




end


function love.draw()

    love.graphics.draw(image.player, x, y,1.2,1,1)
    love.graphics.setColor(0.5,0.5,0.1)
end