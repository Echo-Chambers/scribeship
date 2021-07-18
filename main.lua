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
    local body = entities[1].body
    if love.keyboard.isDown("right") then --press the right arrow key to push the ball to the right
        ent:moveRotate(true)
        elseif love.keyboard.isDown("left") then --press the left arrow key to push the ball to the left
            ent:moveRotate(false)
        elseif love.keyboard.isDown("up") then --press the up arrow key to set the ball in the air
            vec = vector.getAngleVector(ent:getProperty('rotation'))
            body:applyForce(vec.x*4,vec.y*4)
        elseif love.keyboard.isDown("down") then --press the up arrow key to set the ball in the air
            vec = vector.getAngleVector(ent:getProperty('rotation'))
            body:applyForce(vec.x*-4,vec.y*-4)
    end


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