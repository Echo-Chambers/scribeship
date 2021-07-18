player = {
    type = "player",
    properties = {
        rotation = 0
    }
}

player = entity:new(player)
player = entities[player]

-- PLAYER CONTROL


function player:getControl()
    local valid_keys = {'w','s','a','d','space'}
    for i = 1, #valid_keys do

    end
end

function player:processControl()
end







--[[ TEST ]]--
player:setBody(world, 150, 150, true)
player:setShape("circle",10)
player:setFixture()
