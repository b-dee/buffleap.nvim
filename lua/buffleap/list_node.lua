local ListNode = {
  _data = nil,
  _prev = nil,
  _next = nil,
}

ListNode.__index = ListNode

function ListNode:new (data, prev, next)
  local inst = {
    _data = data,
    _prev = prev,
    _next = next,
  }

  setmetatable(inst, self)

  return inst;
end

function ListNode:get_data()
  return self._data
end

function ListNode:get_prev()
  return self._prev
end

function ListNode:get_next()
  return self._next
end

function ListNode:set_data(data)
  self._data = data
end

function ListNode:set_prev(prev)
  self._prev = prev
end

function ListNode:set_next(next)
  self._next = next
end

return ListNode
