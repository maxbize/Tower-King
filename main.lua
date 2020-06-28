require 'philtre.init'  -- Load all engine components into global variables.

function love.load()
  scene = SceneTree()
  txt = Text("Hello world", love.graphics.newFont(20))
  scene:add(txt)
end

function love.update(dt)
  -- Easy exit
  if love.keyboard.isDown('escape') then
    love.event.push('quit')
  end

  scene:update(dt)
end

function love.draw()
  scene:draw()
end
