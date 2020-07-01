-- An animator class that is hardcoded to the logic of this game.
-- State transitions, animation definitions, etc could be generalized out

local Animator = Object:extend()
Animator.className = 'Animator'

-- This data is the same for all Animators
local states = {idle=1, walk=2, attack=3, hit=4}

local frames = {
  -- TODO: Is there a better way to connect this to the enum names?
  {
    {x=0, y=0, duration=0.64},
    {x=1, y=0, duration=0.08},
    {x=2, y=0, duration=0.64},
    {x=1, y=0, duration=0.08}
  }
}

function Animator.update(self, dt)
  local index = 0 -- Which index from the current state's frame to render

  local elapsed = love.timer.getTime() - self.stateStart
  local totalDuration = 0 -- TODO: Cache this?
  for k,v in pairs(frames[self.state]) do
    totalDuration = totalDuration + v.duration
  end

  elapsed = elapsed % totalDuration
  for k,v in pairs(frames[self.state]) do
    index = index + 1
    elapsed = elapsed - v.duration
    if (elapsed < 0) then
      break
    end
  end

  -- Would be nice if there were an official API instead of hacking through to quad :)
  self.qr.quad:setViewport(48 * frames[self.state][index].x, 48 * frames[self.state][index].y, 48, 48)
end

function Animator._setState(self, state)
  self.stateStart = love.timer.getTime()
  self.state = state
end

function newAnimator(self)
  return Animator()
end

function Animator.set(self)
  Animator.super.set(self)
  self.qr = nil
  self.anims = {}
  self._setState(self, states.idle)
end

return Animator