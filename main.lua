local Babble = require("babble")

love.graphics.setFont(love.graphics.newFont("pkmnfl.ttf", 22))

local dialogue = Babble.dialogue()
dialogue:addNode("Start", function(node) node
   :wait(5)

   :text("On the desk there is my invention,")
   :text("the POKeDEX!")
end)

dialogue:switch("Start")

function love.update(dt)
   dialogue:update(dt)
end

local img = love.graphics.newImage("receivedex.png")
img:setFilter("nearest", "nearest")

function love.draw()
   love.graphics.draw(img, 0, 0, 0, 2, 2)

   love.graphics.setColor(255, 0, 0)
   --love.graphics.rectangle("line", 30, 250, 420, 210)

   love.graphics.setColor(48, 80, 200)
   dialogue:draw(33, 257, 420, 210, false)

   love.graphics.setColor(255, 255, 255)
end
