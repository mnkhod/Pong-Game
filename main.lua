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


  if gameState == 'play' then
    ball:update(dt)
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

  push:apply('end')

end

