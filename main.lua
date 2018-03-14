local Babble = require("babble")

love.graphics.setFont(love.graphics.newFont("LCD_Solid.ttf", 22))

local dialogue = Babble.dialogue()
dialogue:addNode("Start", function(node) node
   :text("Hello World!")
end)

dialogue:switch("Start")

function love.update(dt)
   dialogue:update(dt)
end

function love.draw()
   love.graphics.rectangle("line", 10, 330, 620, 300)
   dialogue:draw(20, 340, 600, 280, true)
end
