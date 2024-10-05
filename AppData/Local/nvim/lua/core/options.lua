-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


vim.wo.number = true



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

-- vim.api.nvim_set_hl(0, "LspInlayHint", { fg = '#6A9955', bg = 'NONE' })

local set = vim.opt_local -- set options

-- set.mouse = a
set.wrap = false
set.expandtab = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.smartindent = true

set.listchars = { tab = "> ", space = "•", trail = "."}
set.list = true
set.clipboard = "unnamedplus"

set.cursorline = true
set.foldlevel = 99
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.signcolumn = "yes"
set.updatetime = 30

set.swapfile = false
set.backup = false
set.undofile = true

set.hlsearch = true
set.incsearch = true

set.termguicolors = true


set.scrolloff = 8
-- set.colorcolumn = "80"
--
--


vim.filetype.add(
{
    extensions =
    {
        hlsl = 'slang', -- make .hlsl files to have hlsl filetype so treesitter gives it proper highlight
    }
})