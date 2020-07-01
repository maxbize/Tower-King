
-- Create an n by m ground
-- Not very well optomized since every tile is an independent object. Maybe Philtre could integrated Simple Tiled Implementation?
function createMap(width, height)
  local img = new.image('Assets/Sprites/rpg-dungeon-pack v1.1/tiles_dungeon_v1.1.png')

  -- Draw the ground
  for x = 1, width do
    for y = 1, height do

      -- Pick the sprite. 10, 1 is index of center and we'll offset for sides/corners
      local sprite = {10, 1}
      if (x == 1) then
        sprite[1] = sprite[1] - 1
      elseif (x == width) then
        sprite[1] = sprite[1] + 1
      end
      if (y == 1) then
        sprite[2] = sprite[2] - 1
      elseif (y == width) then
        sprite[2] = sprite[2] + 1
      end

      -- Draw it!
      local tile = Quad(img, {sprite[1] * 16, sprite[2] * 16, 16, 16}, (x-1) * 16 + 8, (y-1) * 16 + 8)
      scene:add(tile)
    end
  end

  -- TODO: Draw the other exterior edges
  for i = 1, width do
    local tile = Quad(img, {15 * 16, 0 * 16, 16, 16}, (i-1) * 16 + 8, height * 16 + 8)
    scene:add(tile)
  end

end
