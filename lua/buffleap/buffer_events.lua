local store = require('buffleap.store')._store
local LinkedList = require('buffleap.linked_list')

local M = {}

M.group = 'buffleap_au_buffer'

M.register_autocmds = function ()
  vim.api.nvim_create_augroup(M.group, { clear = true })

  vim.api.nvim_create_autocmd('BufEnter', {
    group = M.group,
    callback = function (info)
      local bufNo = info.buf
      local winId = vim.fn.win_getid()

      if store[winId] == nil then
        store[winId] = LinkedList:new()
      end

      local winBufList = store[winId]

      local result = winBufList:find(function (item)
        return item == bufNo
      end)

      if result ~= nil then
        winBufList:removeAt(result.index)
      end

      winBufList:prepend(bufNo)

      L('s', store)
    end
  })
end

return M
