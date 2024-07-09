local M = {}
M.os = vim.loop.os_uname().sysname

require("core.plugin_config.nvim-tree")
require("core.plugin_config.scrollview")
require("core.plugin_config.barbar")
require("core.plugin_config.mason")
require("core.plugin_config.lsp_config")
require("core.plugin_config.cmp")
-- require("core.plugin_config.coq_nvim")
-- if package.config:sub(1,1) == '\\'
--if M.os ~= "Linux" or M.os ~= "Windows"
--    then
        -- require("core.plugin_config.snap")
--        require("core.plugin_config.telescope")
--        require("core.plugin_config.recent_files")
--    else
        require("core.plugin_config.fzf-lua")
--end
-- require("core.plugin_config.tabby")
require("core.plugin_config.comment")
require("core.plugin_config.treesitter")
require("core.plugin_config.treesitter-context")
require("core.plugin_config.hop")
require("core.plugin_config.symbols-outline")
-- require("core.plugin_config.inlayhint")
require("core.plugin_config.local-highlight")
require("core.plugin_config.undo")
-- require("core.plugin_config.clangd-extensions")
require("core.plugin_config.harpoon")
require("core.plugin_config.refactoring")
require("core.plugin_config.indent-blankline")

require("core.plugin_config.vscode")
-- require("core.plugin_config.scrollbar")
-- require("core.plugin_config.hlslens")
-- require("core.plugin_config.neoscroll")
