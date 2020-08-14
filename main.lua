push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200 

function love.load()
  
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

  player1_y = 30
  player2_y = VIRTUAL_HEIGHT - 50

end

function love.update(dt)
  
  -- Player 1 Movement
  if love.keyboard.isDown('w') then
    -- add negative paddle speed , scaled by deltaTime #Up
    player1_y = player1_y + -PADDLE_SPEED * dt
  elseif love.keyboard.isDown('s') then
    -- add positive paddle speed , scaled by deltaTime #Down
    player1_y = player1_y + PADDLE_SPEED * dt
  end

  -- Player 2 Movement
  if love.keyboard.isDown('up') then
    player2_y = player2_y + -PADDLE_SPEED * dt
  elseif love.keyboard.isDown('down') then
    player2_y = player2_y + PADDLE_SPEED * dt
  end

end


function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
end



function love.draw()
  
  push:apply('start')

  love.graphics.clear(40/255, 45/255, 52/255, 255/255)

  love.graphics.setFont(small_font)
  love.graphics.printf('Hello Pong!',0,20,VIRTUAL_WIDTH,'center')

  love.graphics.setFont(score_font)
  love.graphics.print(tostring(player1_score),VIRTUAL_WIDTH/2-50,VIRTUAL_HEIGHT/3)
  love.graphics.print(tostring(player2_score),VIRTUAL_WIDTH/2+50,VIRTUAL_HEIGHT/3)

  -- First Paddle
  love.graphics.rectangle('fill',10,player1_y,5,20)

  -- Second Paddle
  love.graphics.rectangle('fill',VIRTUAL_WIDTH-10,player2_y,5,20)

  -- Render Ball
  love.graphics.rectangle('fill',VIRTUAL_WIDTH/2-2,VIRTUAL_HEIGHT/2-2,4,4)

  push:apply('end')

end

