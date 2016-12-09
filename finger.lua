local cursor = {}

cursor.enter = function(cursor, menu)
  cursor.menu = menu
  cursor.item = menu[menu[1]]

  if type(cursor.item) ~= "table" then error("cursor is not pointing to a table field", 2) end
end

local action = function(cursor, action)
  local target = cursor.item[action] or cursor.menu[action]

  if type(target) == "string" then
    cursor.item = cursor.menu[target]
  end

  if type(target) == "table" then
    cursor.item = target
  end

  if type(target) == "function" then
    target()
  end

  if type(cursor.item) ~= "table" then error("cursor is not pointing to a table field", 2) end
end

cursor.new = function()
  local object = {}

  object.enter = cursor.enter
  setmetatable(object, {__call = action})

  return object
end

setmetatable(cursor, {__call = action})
return cursor
