-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.g.neovide_cursor_animation_length = 0

vim.g.neovide_cursor_trail_size = 0

vim.api.nvim_set_keymap('n', '<C-n>', ':noh <CR>', {silent = true})
vim.g.neovide_fullscreen = true
vim.o.guifont = "Cascadia Mono:h12" -- text below applies for VimScript
vim.opt.linespace = 4