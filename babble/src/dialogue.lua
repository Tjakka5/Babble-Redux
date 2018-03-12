local SUBPATH = (...):gsub('%.[^%.]+%.[^%.]+$', '')

local Class = require(SUBPATH..".lib.class")

local Node = require(SUBPATH..".src.node")

local Dialogue = Class()

--- Creates a new Node and initializes it with constructor 'id'.
-- @param parent The parent Dialogue
-- @param id The ID of the constructor
-- @return The new initialized Node
local function newNodeInstance(parent, id)
   local constructor = parent.constructors[id]
   local node        = Node(parent)

   return constructor(node) or node
end

--- Initializes the Dialogue.
function Dialogue:init()
   self.constructors = {}

   self.stack   = {}
   self.current = nil
end

--- Clears the stack and switches to the Node.
-- @param id The ID of the Node
-- @return self
function Dialogue:switch(id)
   local node = newNodeInstance(self, id)

   self.stack   = {node}
   self.current = node

   return self
end

--- Pushes the Node to the stack.
-- @param id The ID of the Node
-- @return self
function Dialogue:push(id)
   local node = newNodeInstance(self, id)

   self.stack[#self.stack + 1] = node
   self.current                = node

   return self
end

--- Pops the current Node from the stack.
-- @return self
function Dialogue:pop()
   self.stack[#self.stack] = nil
   self.current            = self.stack[#self.stack]

   return self
end

--- Adds a constructor for the Node with ID.
-- @param id The ID of the constructor
-- @param constructor The constructor function
-- @return self
function Dialogue:addNode(id, constructor)
   self.constructors[id] = constructor

   return self
end

--- Updates the current Node.
-- @param dt Delta time
-- @return self
function Dialogue:update(dt)
   while self.current do
      local continue, state = self.current:update(dt)

      if continue then
         if type(state) == "string" then
            self:push(state)
         elseif not state then
            self:pop()
         end
      else
         break
      end
   end

   return not self.current
end

--- Draws all of the Dialogue in a box.
-- @param x The x position
-- @param y The y position
-- @param w The width
-- @param h The height
-- @param drawBorder To draw a debug border or not
-- @return self
function Dialogue:draw(x, y, w, h, drawBorder)
   if drawBorder then
      love.graphics.rectangle("line", x, y, w, h)
   end

   return self
end

return Dialogue
