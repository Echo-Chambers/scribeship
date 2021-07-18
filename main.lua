require("map")
require("physics")
require("entity")
require("assets")
require("player")

local x, y = 0
function love.load()
    --map.construct()
    local testent = entity:new({
        level = 1,
        position = {x = 400, y = 52}
    })
    entities[testent]:setProperty('texture',image.player2)
    entities[testent].type = "enemy"
    map.registerMapObject(testent)
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
    map.hierarchicalRender()
end