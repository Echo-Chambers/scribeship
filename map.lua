
map = {}
map.width = 16
map.height = 16
map.gridType = "square"
map.size = map.width * map.height
map.objects = {} -- sequence of layered-tables containing objects

-- MAP PARAMETERS

map.width, map.height = love.graphics.getWidth, love.graphics.getHeight



-- MAP COLOR

function map:color(color) -- sets current drawing color to [color] or to the blank color
    if(color)then
        love.graphics.setColor(color)
    else love.graphics.setColor(0,0,0)
    end
end




-- MAP OBJECTS
function map:add_object(object, level)
    table.insert(self.objects[level], object)
end


-- MAP RENDERING

map.construct = function()
    local w = map.width
    local h = map.height

    for i = 1, 6 do
        map.objects[i] = {}
    end
    --[[for i = 1, #self.objects do -- change for dual table reference
        local obj = self.objects[i][1]
        --love.graphics.dra
    end]]
end
map.construct()

map.registerMapObject = function(id) -- provide entity id
    local ent = entities[id]
    local layer = ent.layer
    map.objects[layer][id] = ent
end

map.hierarchicalRender = function()
    for i = 1, #map.objects do
        local layer = map.objects[i]
        for k,v in pairs(layer) do
            v:render()
        end
    end
end