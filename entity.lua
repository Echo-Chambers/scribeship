entities = {}
entity = {
    type = 'blank',
    properties = {},
    events = {},
    position = {x = 0, y = 0},
}

entity.properties.visual = 'sprite'
entity.properties.texture = 'ship.png'

local ent = entity

function entity:new(data)
    --[[local proto = entity
    for k,v in pairs(proto)do
        data[k] = data[k] or v
    end]]
    setmetatable(data, entity)
    local num = #entities + 1
    data.id = num
    entities[num] = data
    return num
end


-- LOVE PHYSICS Wrappers

function entity:setBody(world,x,y)
    self.body = love.physics.newBody(world,x,y)
end

function entity:setShape(type,dim1,dim2)
    if(type == "circle")then
    self.shape = love.physics.newCircleShape(dim1)
    elseif(type == "rectangle")then
    self.shape = love.physics.newRectangleShape(dim1,dim2)
    end
end

function entity:setFixture( density, body, shape)
    body = body or self.body
    shape = shape or self.shape
    density = density or 1
    self.fixture = love.physics.newFixture(body, shape, density)
end