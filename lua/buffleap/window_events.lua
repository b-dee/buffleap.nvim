local M = {}

M.group = 'buffleap_autocmds'

M.register_autocmds = function ()
  vim.api.nvim_create_augroup(M.group, { clear = true })
  vim.api.nvim_create_autocmd('WinNew', {
    callback = function (info)
      P(info)
    end
  })
end

return M
