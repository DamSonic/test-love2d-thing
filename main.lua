function love.load()
    target = {}
    target.x = 300
    target.y = 300
    target.radius = 50

    evil = {}
    evil.x = -100
    evil.y = -100
    evil.radius = 50


    score = 0
    timer = 0

    gameFont = love.graphics.newFont(40)

    background = love.graphics.newImage('sprites/BG.png')
    targetSprite = love.graphics.newImage('sprites/target.png')
    EVILSprite = love.graphics.newImage('sprites/EVILtarget.png')


    sounds = {}
    sounds.hit = love.audio.newSource("SFX/hit.wav", "static")
end

function love.update(dt)

end

function love.draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.setColor(1, 1, 1, 0)
    love.graphics.circle("fill", target.x, target.y, target.radius)

    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(targetSprite, target.x - 50, target.y - 50)

    -- code for the evil
    love.graphics.setColor(1, 1, 1, 0)
    love.graphics.circle("fill", evil.x, evil.y, evil.radius)

    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(EVILSprite, evil.x - 50, evil.y - 50)

    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(gameFont)
    love.graphics.print(score, 0, 0)

end

function love.mousepressed( x, y, button, istouch, presses)
    if button == 1 then
        local mouseToTarget = distanceBetween(x, y, target.x, target.y)
        if mouseToTarget < target.radius then
            score = score + 1
            sounds.hit:play()
            target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
            target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
        end
    end
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt( (x2 - x1)^2 + (y2 - y1)^2 )
end