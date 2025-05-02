local M = {}
M.os = vim.loop.os_uname().sysname

require("core.plugin_config.nvim-tree")
require("core.plugin_config.scrollview")
require("core.plugin_config.barbar")
require("core.plugin_config.mason")
-- require("core.plugin_config.lsp_config")
require("core.plugin_config.fzf-lua")
require("core.plugin_config.comment")
require("core.plugin_config.treesitter")
-- require("core.plugin_config.hop")
require("core.plugin_config.symbols-outline")
require("core.plugin_config.local-highlight")
require("core.plugin_config.undo")
require("core.plugin_config.harpoon")
require("core.plugin_config.refactoring")
require("core.plugin_config.indent-blankline")
require("core.plugin_config.copilot")
-- require("core.plugin_config.cmp")


require("core.plugin_config.marks")
require("core.plugin_config.vscode")
-- require("core.plugin_config.p4")
