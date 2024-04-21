local ListNode = require('buffleap.list_node')

local LinkedList = {
  _head = nil,
  _len = 0,
}

LinkedList.__index = LinkedList

function LinkedList:new ()
  local inst = {};
  setmetatable(inst, self)
  return inst
end

function LinkedList:prepend (data)
  local node = ListNode:new(data, self._head)

  if self._head ~= nil then
    self._head._next = node;
  end

  self._head = node;
  self._len = self._len + 1
end

function LinkedList:isWithinBounds (index)
  local current = self._head

  return not (
    current == nil
    or index < 0
    or index > (self._len - 1)
  )
end

function LinkedList:removeAt (index)
  local current = self._head

  if not self:isWithinBounds(index) then
    error('Index out of bounds', 2)
  end

  for _ = 1, index do
    current = current._prev
  end

  -- Join prev and next, forgetting current
  local prev = current._prev
  local next = current._next
  prev._next = current._next
  next._prev = current._prev

  self._len = self._len - 1
end

function LinkedList:at (index)
  local current = self._head

  if not self:isWithinBounds(index) then
    error('Index out of bounds', 2)
  end

  for _ = 1, index do
    current = current._prev
  end

  return current._data
end

function LinkedList:find (callback)
  local current = self._head
  local index = 0

  while current ~= nil do
      -- Call callback on each item and return first match
      if callback(current._data, index) then
        return {
          index = index,
          data = current._data
        }
      end

      current = current._prev
      index = index + 1
  end

  return nil
end

return LinkedList
