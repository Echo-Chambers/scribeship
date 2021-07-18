entities = {}
entity = {
    type = 'blank',
    properties = {
        rotation = 0,
        offset = {x = 0, y = 0},
        scale = {x = 1, y = 1}
    },
    layer = 1,
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

function entity:getid()
    return self.id
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
    local x,y
    if(self.body)then
        x,y = self.body:getPosition()
    else x,y = self.position.x, self.position.y 
    end
    return {x = x, y = y}
end

function entity:setPosition()
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

function entity:performMotion(label)
    if(label == 'thrust')then
        vec = vector.getAngleVector(self:getProperty('rotation'))
        self:propel(vec.x*4,vec.y*4)
    elseif(label == 'brake')then
        vec = vector.getAngleVector(self:getProperty('rotation'))
        self:propel(vec.x*-4,vec.y*-4)
    elseif(label == 'rotL')then
        self:moveRotate()
    elseif(label == 'rotR')then
        self:moveRotate(true)
    end
end

-- Properties

function entity:setProperty(label, value)
    self.properties[label] = value
end

function entity:getProperty(label)
    return self.properties[label]
end

-- Visual

function entity:render()
    if(self.type ~= 'blank' and self.properties.texture)then
        local tex = self:getProperty("texture")
        local pos = self:getPosition()
        local rot = self:getProperty('rotation')
        local scale = self:getProperty('scale') or {x = 1, y = 1}
        local off = self:getProperty('offset')
        love.graphics.draw(tex, pos.x, pos.y, rot, scale.x, scale.y, off.x, off.y)
    end
end