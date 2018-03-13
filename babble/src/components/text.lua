local SUBPATH = (...):gsub('%.[^%.]+%.[^%.]+%.[^%.]+$', '')

local Class = require(SUBPATH..".lib.class")
local Content = require(SUBPATH..".src.content")

local Text = Class()

function Text:init(node, text)
   self.node = node
   self.text = text
   self.pos  = 0

   self.content = Content("")
   node.parent:addContent(self.content)

   self.currTime = 0
   self.maxTime  = 0.05
end

function Text:update(dt)
   self.currTime = self.currTime + dt

   if self.currTime >= self.maxTime then
      self.currTime = 0

      self.pos = self.pos + 1

      self.content.subject = self.text:sub(0, self.pos)
      print(self.content.subject)
      return self.pos == #self.text
   end
end

return Text
