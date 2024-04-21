local store = require('buffleap.store')._store
local LinkedList = require('buffleap.linked_list')

local M = {}

M.group = 'buffleap_au_window'

M.register_autocmds = function ()
  vim.api.nvim_create_augroup(M.group, { clear = true })

  vim.api.nvim_create_autocmd('WinNew', {
    group = M.group,
    callback = function ()
      local winId = vim.fn.win_getid()
      store[winId] = LinkedList:new()
      L('s', store)
    end
  })

  vim.api.nvim_create_autocmd('WinClosed', {
    group = M.group,
    callback = function ()
      local winId = vim.fn.win_getid()
      store[winId] = nil
      L('s', store)
    end
  })
end

return M
