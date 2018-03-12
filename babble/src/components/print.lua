local SUBPATH = (...):gsub('%.[^%.]+%.[^%.]+%.[^%.]+$', '')

local Class = require(SUBPATH..".lib.class")

local Print = Class()

function Print:init(message)
   self.message = message
end

function Print:update()
   print(self.message)

   return true
end

return Print
