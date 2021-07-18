entities = {}
entity = {
    id2 = "gg",
    type = 'blank',
    properties = {
        rotation = 0
    },
    events = {},
    position = {x = 0, y = 0},
}

entity.properties.visual = 'sprite'
entity.properties.texture = 'ship.png'

local ent = entity

function entity:new(data)
    setmetatable(data, entity)
    entity.__index = entity
    local num = #entities + 1
    data.id = num
    entities[num] = data
    return num
end


-- LOVE PHYSICS Wrappers

function entity:setBody(world,x,y, dynamic)
    self.body = love.physics.newBody(world,x,y, dynamic and "dynamic" or "static")
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

function entity:setPhysicsProperties(props)

end




function entity:getPosition()
    local x,y = self.body:getPosition()
    return {x = x, y = y}
end


-- Motion and Rotation

function entity:moveRotate(bool)
    local dir = bool and 1 or -1
    local rot = self:getProperty('rotation')

    self.properties.rotation = math.abs(rot) <= math.pi*2 and self.properties.rotation + dir/10 or 0.11
end


function entity:propel(x,y)
    self.body:applyForce(x,y)
end

-- Properties

function entity:setProperty(label, value)
    self.properties[label] = value
end

function entity:getProperty(label)
    return self.properties[label]
end
