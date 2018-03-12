local PATH = (...):gsub("%.init$", "")

local Babble = {}

Babble.dialogue = require(PATH..".src.dialogue")

return Babble
