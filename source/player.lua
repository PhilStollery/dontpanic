import "bullet"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(gfx.sprite)

function Player:init(x, y)
    Player.super.init(self)
    local playerImage = gfx.image.new("images/ship-0")
    self:setImage(playerImage)
    self:moveTo(x, y)
    self:add()

    self.speed = 1
end

function Player:update()
    if pd.buttonIsPressed(pd.kButtonUp) then
        if self.y > 0 then
            self:moveBy(0, -self.speed)
        end
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        if self.y < 240 then
            self:moveBy(0, self.speed)
        end
    end
    if pd.buttonIsPressed(pd.kButtonLeft) then
      if self.x > 0 then
          self:moveBy(-self.speed, 0)
      end
  elseif pd.buttonIsPressed(pd.kButtonRight) then
      if self.x < 400 then
          self:moveBy(self.speed, 0)
      end
  end

    if pd.buttonJustPressed(pd.kButtonA) then
        Bullet(self.x+3, self.y+8, 7)
    end
end