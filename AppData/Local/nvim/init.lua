require("core.keymaps")
require("core.plugins")
require("core.plugin_config")
require("core.neovide")
require("core.options")

-- luasnip bug while using Tab
-- vim.api.nvim_create_autocmd('ModeChanged', {
--   pattern = '*',
--   callback = function()
--     if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
--         and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
--         and not require('luasnip').session.jump_active
--     then
--       require('luasnip').unlink_current()
--     end
--   end
-- })

--colorscheme kanagawa
vim.cmd [[colorscheme default]]
