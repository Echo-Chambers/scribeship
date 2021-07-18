gravity = 0.985
love.physics.setMeter(30)
world = love.physics.newWorld(0,gravity,true)

vector = {}

vector.getAngleVector = function(angle)
    local quad = {{x = 1, y = 1},{x = -1, y = 1},{x = -1, y = -1},{x = 1, y = -1}}

    function findquadrant(ang)
        ang = math.abs(ang)
        local quadrant = (ang > 90 and math.floor( ang/90 )) or 1
        return quadrant
    end

    adjacent = math.cos(angle)*16
    opposite = math.tan(angle)*adjacent

    quad = quad[findquadrant(angle)]
    return {x = adjacent*quad.x, y = opposite*quad.y}
end