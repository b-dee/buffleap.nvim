local window_events = require('buffleap.window_events')

local M = {}

-- WinEnter and WinClosed, create/remove LRU
-- BufWinEnter(?) to update LRU
-- Find out which for removing buffer from LRU
-- keybindings for prev/next
-- logic for new list head if changed
-- logic for not modifing LRU on jumps
M.setup = function ()
  window_events.register_autocmds();
end

return M
