local Hero = Object:extend()

Hero.className = 'Hero'

function createHero(x, y)
  createMap(10, 10)

  local hero = mod(Hero(x, y), { children = {
      Quad("Assets/Sprites/rpg-dungeon-pack v1.1/chara_hero.png", {0, 0, 0, 0}), -- Animator will manipulate quad
      newAnimator()
  } })

  -- Can't assign this in the constructor since the reference doesn't exist yet :(
  hero.children[2].qr = hero.children[1]
  scene:add(hero)
  return hero
end

function Hero.set(self, x, y)
  Hero.super.set(self, x, y)

end

return Hero