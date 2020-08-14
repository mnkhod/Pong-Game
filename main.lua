-- https://github.com/Ulydev/push
push = require 'push'

-- https://github.com/vrld/hump/blob/master/class.lua
Class = require 'class'

require 'Paddle'
require 'Ball'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200 





function love.load()

  -- use current time to seed random
  math.randomseed(os.time())

  -- nearest-neighbor filtering on upscaling and downscaling to prevent blurring of text and graphics
  love.graphics.setDefaultFilter('nearest','nearest')

  small_font = love.graphics.newFont('font.ttf',8)
  score_font = love.graphics.newFont('font.ttf',32)

  love.graphics.setFont(small_font)

  love.window.setTitle("Pong")


  push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT,{
    fullscreen = false,
    resizable = false,
    vsync = true
  })

  player1_score = 0
  player2_score = 0

  gameState = 'start'


  player1 = Paddle(10,30,5,20)
  player2 = Paddle(VIRTUAL_WIDTH-10,VIRTUAL_HEIGHT-30,5,20)

  ball = Ball(VIRTUAL_WIDTH/2 - 2 , VIRTUAL_HEIGHT/2 - 2 , 4 , 4)

end




function love.update(dt)


  if gameState == 'play' then


    if ball:collide(player1) then
      ball.dx = -ball.dx * 1.03
      ball.x = player1.x + 5

      if ball.dy < 0 then
        ball.dy = -math.random(10,150)
      else
        ball.dy = math.random(10,150)
      end

    end

    if ball:collide(player2) then
      ball.dx = -ball.dx * 1.03
      ball.x = player2.x - 4

      if ball.dy < 0 then
        ball.dy = -math.random(10,150)
      else
        ball.dy = math.random(10,150)
      end

    end


    if ball.y <= 0 then
      ball.y = 0
      ball.dy = -ball.dy
    end

    -- -4 for the size of the ball
    if ball.y >= VIRTUAL_HEIGHT - 4 then
      ball.y = VIRTUAL_HEIGHT - 4
      ball.dy = -ball.dy
    end


    ball:update(dt)
  end

  -- Check if ball has gone over the wall or not , SCORE SYSTEM
  
  if ball.x < 0 then
    serving_player = 1
    player2_score = player2_score + 1
    ball:reset()
    gameState = 'start'
  end

  if ball.x > VIRTUAL_WIDTH then
    serving_player = 2
    player1_score = player1_score + 1
    ball:reset()
    gameState = 'start'
  end



  -- Player 1 Movement
  if love.keyboard.isDown('w') then
    -- add negative paddle speed , scaled by deltaTime #Up
    -- clamping it with math.max so it wont go above
    player1.dy = -PADDLE_SPEED
  elseif love.keyboard.isDown('s') then
    -- add positive paddle speed , scaled by deltaTime #Down
    player1.dy = PADDLE_SPEED
  else
    player1.dy = 0
  end

  -- Player 2 Movement
  if love.keyboard.isDown('up') then
    player2.dy = -PADDLE_SPEED
  elseif love.keyboard.isDown('down') then
    player2.dy = PADDLE_SPEED
  else
    player2.dy = 0
  end



  player1:update(dt)
  player2:update(dt)

end



function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  elseif key == 'enter' or key == 'return' then
    if gameState == 'start' then
      gameState = 'play'
    else
      gameState = 'start'

      ball:reset()
    end
  end

end



function love.draw()
  
  push:apply('start')

  love.graphics.clear(40/255, 45/255, 52/255, 255/255)

  love.graphics.setFont(small_font)
  if gameState == 'start' then
    love.graphics.printf('Start Game By Pressing Enter!',0,20,VIRTUAL_WIDTH,'center')
  else
    love.graphics.printf('Game Created By mnkhod!',0,20,VIRTUAL_WIDTH,'center')
  end

  love.graphics.setFont(score_font)
  love.graphics.print(tostring(player1_score),VIRTUAL_WIDTH/2 - 50,VIRTUAL_HEIGHT/3)
  love.graphics.print(tostring(player2_score),VIRTUAL_WIDTH/2 + 50,VIRTUAL_HEIGHT/3)

  -- First Paddle
  player1:render()

  -- Second Paddle
  player2:render()

  -- Render Ball
  ball:render()

  -- Render FPS
  displayFPS()

  push:apply('end')

end


function displayFPS()
  love.graphics.setFont(small_font)
  love.graphics.setColor(0,255,0,255)
  love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()),10,10)
end

