player = {
    type = "player",
    layer = 2,
    properties = {
        rotation = 0,
        texture = image.player,
        offset = {x = 32,y = 32}
    }
}

player = entity:new(player)
player = entities[player]
player.id = 1
-- PLAYER CONTROL


function player:processControl()
    local valid_keys = {'w','s','a','d','space'}
    local key_actions = {'thrust','brake','rotL','rotR','tooluse'}
    for i = 1, #valid_keys do
        local key = valid_keys[i]
        valid_keys[i] = love.keyboard.isDown(key)
        
        if(valid_keys[i])then
            self:performMotion(key_actions[i])
        end
    end

end



--[[ TEST ]]--
player:setBody(world, 150, 150, true)
player:setShape("circle",10)
player:setFixture()
map.registerMapObject(player:getid())