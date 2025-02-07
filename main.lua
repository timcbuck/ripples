local love = require "love"


function love.load()
    circles = {}
    sizeFactor = 100
    maxRadius = math.sqrt(love.graphics.getHeight()^2 + love.graphics.getWidth()^2) -- max radius is the diagonal distance of window
end

function love.update(dt)
    -- Increase circle radius and delete circles no longer on the screen
    -- Loop through circles backwards to avoid issues with deleting table elements
    for i = #circles, 1, -1 do
        circles[i].radius = circles[i].radius + sizeFactor * dt
        if circles[i].radius > maxRadius then
            table.remove(circles, i)
        end
    end
end

function love.draw()
    for _, c in ipairs(circles) do
        love.graphics.circle("line", c.x, c.y, c.radius)
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then
        createCircle(x, y)
    end
end

function createCircle(x, y)
    local circle = {
        x = x,
        y = y,
        radius = 0,
    }
    table.insert(circles, circle)
end
