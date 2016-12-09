cursor = require 'finger'

love.load = function(dt)
  --String in the first index is used as the default entry point
  menu = {"Item"}

  --Strings in navigation refers to other menu elements, functions to logic to be executed
  menu.Item = {up = "Magic", down = "Magic", x = 100, y = 100}

  --Navigation is resolved locally then globally
  menu.Item.escape = function() print("specific escape action") end
  menu.escape = function() cursor:enter(menu); print("default escape action") end

  --Menu entries can have their own data fields as well
  menu.Magic = {up = "Item", down = "Item", x = 100, y = 120}
  menu.Magic.enter = function() print("specific enter action") end

  cursor:enter(menu)
end

love.draw = function()
  love.graphics.print(cursor.item.x.." "..cursor.item.y)
  love.graphics.circle("fill", cursor.item.x, cursor.item.y, 5, 10)
end

love.keypressed = function(key)
  --return is a reserved word
  if key == "return" then key = "enter" end

  --Object is used as a function to navigate in the menu
  cursor(key)
end
