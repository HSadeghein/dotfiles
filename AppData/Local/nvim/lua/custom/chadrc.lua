---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
  lsp_semantic_tokens = true, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

M.my_mapping = {
    n = {
        ["<C-n>"] = {":noh <CR>", "clear highlight"},
        ["<A-o>"] = {":ClangdSwitchSourceHeader <CR>", "Switch header/source", opts = {nowait = true}},
    }
    i =
    {
        ["<C-BS>"] = {"<C-W>", "delete the word"},
    }
}

-- M.telescope = {
--   plugin = true,

--   n = {
--     -- find
--     ["<C-S-o>"]    = { "<cmd> Telescope treesitter <CR>", "outline" },
--     ["<leader>gd"]    = { "<cmd> Telescope lsp_references <CR>", "list of references" },
--   },
-- }
return M
