local SUBPATH = (...):gsub('%.[^%.]+%.[^%.]+$', '')

local Class = require(SUBPATH..".lib.class")

local Content = Class()

--- Initializes the Content
function Content:init(subject)
   self.subject   = subject
   self.modifiers = {
      color        = {255, 255, 255, 255},
      underline    = false,
      striketrough = false,
      align        = "left",
   }
   self.effects   = {}
end

return Content
