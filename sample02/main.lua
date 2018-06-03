local Message = 0

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    Heroset = love.graphics.newImage("assets/hero.png")

    HerosetW, HerosetH = Heroset:getWidth(), Heroset:getHeight()
    HeroW, HeroH = 16, 16

    HeroQuad = love.graphics.newQuad(16, 32, HeroW, HeroH, HerosetW, HerosetH)

    -- Animation parameters
    FPS = 6
    AnimationTimer = 1 / FPS
    Frame = 1
    NumberOfFrames = 6
    Xoffset = 16
end

function love.update(dt)
    AnimationTimer = AnimationTimer - dt

    if AnimationTimer <= 0 then
        AnimationTimer = 1 / FPS
        Frame = Frame + 1
        if Frame > NumberOfFrames then Frame = 1 end
        Xoffset = 16 * Frame
        HeroQuad:setViewport(Xoffset, 32, 16, 16)
    end
end

function love.draw()
    love.graphics.print(Message, 0, 0)
    love.graphics.draw(Heroset, HeroQuad, 320, 180, 0, 8, 8)
end