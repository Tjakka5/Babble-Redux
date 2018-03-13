local SUBPATH = (...):gsub('%.[^%.]+%.[^%.]+%.[^%.]+$', '')

local Class = require(SUBPATH..".lib.class")

local Wait = Class()

function Wait:init(_, waitTime)
   self.currTime = 0
   self.waitTime = waitTime
end

function Wait:update(dt)
   self.currTime = self.currTime + dt

   if self.currTime >= self.waitTime then
      return true
   end
end

return Wait
