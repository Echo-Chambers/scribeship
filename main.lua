require("map")
require("physics")
require("entity")
require("assets")
require("player")

local x, y = 0
function love.load()
end


function love.update(dt)
    world:update(dt)
    -- SHUTDOWN CHECK
    if(love.keyboard.isDown('escape'))then
        love.event.quit(true)
    end
    -- SHUTDOWN CHECK
    local ent = entities[1]
    ent:processControl()

end


function love.draw()
    love.graphics.draw(image.background, 1,1, 0,10,10)
    local pos = entities[1]:getPosition()
    local ent = entities[1]
    love.graphics.draw(image.player, pos.x, pos.y,ent:getProperty("rotation"),1,1,32,32)
    love.graphics.print(ent:getProperty("rotation"), 333,333)
    if(vec)then
    love.graphics.print(vec.x, 333,343)
    love.graphics.print(opposite, 333,353)

end
    
end