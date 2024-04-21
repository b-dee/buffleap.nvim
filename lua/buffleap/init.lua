local window_events = require('buffleap.window_events')
local buffer_events = require('buffleap.buffer_events')

local M = {}

M.setup = function ()
  window_events.register_autocmds();
  buffer_events.register_autocmds();
end

return M
