require("core.keymaps")
require("core.plugins")
require("core.plugin_config")
require("core.neovide")

vim.cmd [[colorscheme everforest]]

vim.wo.number = true
vim.opt.cursorline = true


---WORKAROUND
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})
vim.opt.foldenable = false
---ENDWORKAROUND


local set = vim.opt -- set options

set.expandtab = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

set.listchars = { tab = "> ", space = "•", trail = "."}
set.list = true
set.clipboard = "unnamedplus"


set.foldlevel = 99
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.signcolumn = "yes"


