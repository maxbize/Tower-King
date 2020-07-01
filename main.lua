-- Global vars
scriptsDir = 'Assets/Scripts/'

require('philtre.init')  -- Load all engine components into global variables.
require(scriptsDir .. 'map')
require(scriptsDir .. 'hero')
require(scriptsDir .. 'animator')

function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest") -- pixel art
  love.graphics.setBackgroundColor(20/255, 11/255, 40/255)
  scene = SceneTree()
  createMap(8, 8)
  createHero(50, 50)
end

function love.update(dt)
  -- Easy exit
  if love.keyboard.isDown('escape') then
    love.event.push('quit')
  end

  scene:update(dt)
end

function love.draw()
  love.graphics.scale(4) -- pixel art
  scene:draw()
end

