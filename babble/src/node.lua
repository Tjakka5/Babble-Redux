local SUBPATH = (...):gsub('%.[^%.]+%.[^%.]+$', '')

local Class = require(SUBPATH..".lib.class")

local Node = Class()

--- Initializes the Node
function Node:init()
   self.components = {}
   self.current    = 1
end

--- Updates the current Node
-- @param dt Delta time
-- @return True if node is done. False otherwise
function Node:update(dt)
   local component = self.components[self.current]

   if component then
      local state = component:update(dt)

      if state then
         self.current = self.current + 1

         return true, state
      else
         return false, false
      end
   end

   return true, false
end

--- Adds a new Component to the Node
-- @param component The Component to add
-- @return self
function Node:addComponent(component)
   self.components[#self.components + 1] = component

   return self
end

--- Defines a constructor as a Component
-- @param name The name of the Component
-- @param constructor The constructor of the Component
function Node.defineComponent(name, constructor)
   Node[name] = function(self, ...)
      return self:addComponent(constructor(...))
   end
end

Node.defineComponent("print", require(SUBPATH..".src.components.print"))
Node.defineComponent("wait",  require(SUBPATH..".src.components.wait"))

return Node
