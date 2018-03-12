local Babble = require("babble")

local dialogue = Babble.dialogue()
dialogue:addNode("Start", function(node) node
   :print("Hello world!")
   :print("How U do?")

   :wait(0.5)

   :print("Bamboozled")
end)

dialogue:switch("Start")

function love.update(dt)
   dialogue:update(dt)
end

function love.draw()
   love.graphics.rectangle("line", 10, 370, 620, 260)
   dialogue:draw(20, 380, 600, 240, true)
end
