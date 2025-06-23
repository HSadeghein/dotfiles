return {
    'ibhagwan/fzf-lua',
    lazy = false,
    opts = {
        { "default-title" }, -- base profile
        desc = "fzf-native with no git|files icons",
        winopts = { preview = { default = "bat" }, treesitter = false },
        manpages = { previewer = "man_native" },
        helptags = { previewer = "help_native" },
        defaults = { git_icons = false, file_icons = false },
        lsp = { code_actions = { previewer = "codeaction_native" } },
        tags = { previewer = "bat" },
        btags = { previewer = "bat" },
        files = { fzf_opts = { ["--ansi"] = false } },
        grep = {
            fzf_opts  = { ["--ansi"] = false },
            rg_glob   = false, -- will trigger `opts.requires_processing`
            grep_opts = (vim.loop.os_uname().sysname == "Darwin")
                and "--color=never --binary-files=without-match --line-number --recursive --extended-regexp -e"
                or "--color=never --binary-files=without-match --line-number --recursive --perl-regexp -e",
            rg_opts   =
            " --color=never --column --line-number --no-heading --smart-case --max-columns=4096 -e",
        },
        -- ...other options as needed...
    },
    keys = {
        { "<leader>ff",       "<cmd>lua require('fzf-lua').files()<CR>",                 mode = "n", silent = true },
        { "<leader>fg",       "<cmd>lua require('fzf-lua').live_grep()<CR>",             mode = "n", silent = true },
        { "<leader>fb",       "<cmd>lua require('fzf-lua').buffers()<CR>",               mode = "n", silent = true },
        { "<leader>fs",       "<cmd>lua require('fzf-lua').grep_cword()<CR>",            mode = "n", silent = true },
        { "gr",               "<cmd>lua require('fzf-lua').lsp_references()<CR>",        mode = "n", silent = true },
        { "<leader>ca",       "<cmd>lua require('fzf-lua').lsp_code_actions()<CR>",      mode = "n", silent = true },
        { "<leader>fe",       "<cmd>lua require('fzf-lua').diagnostics_workspace()<CR>", mode = "n", silent = true },
        { "<leader><leader>", "<cmd>lua require('fzf-lua').oldfiles()<CR>",              mode = "n", silent = true },
        { "<leader>fb",       "<cmd>lua require('fzf-lua').buffers()<CR>",               mode = "n", silent = true }
    },
}
-- return {
--     'nvim-telescope/telescope.nvim',
--     tag = '0.1.8',
--     dependencies = { 'nvim-lua/plenary.nvim' },
--     lazy = false,
--     opts = {
--         defaults = {
--             file_ignore_patterns = { "node_modules" },
--             layout_config = {
--                 horizontal = {
--                     preview_width = 0.6,
--                 },
--             },
--         },
--         pickers = {
--             find_files = {
--                 hidden = true,
--             },
--             live_grep = {
--                 additional_args = function(opts)
--                     return { "--hidden" }
--                 end
--             },
--         },
--     },
--     keys = {
--         { "<leader>ff",       "<cmd>Telescope find_files<CR>",       mode = "n", silent = true },
--         { "<leader>fg",       "<cmd>Telescope live_grep<CR>",        mode = "n", silent = true },
--         { "<leader>fb",       "<cmd>Telescope buffers<CR>",          mode = "n", silent = true },
--         { "<leader>fs",       "<cmd>Telescope grep_string<CR>",      mode = "n", silent = true },
--         { "gr",               "<cmd>Telescope lsp_references<CR>",   mode = "n", silent = true },
--         { "<leader>ca",       "<cmd>Telescope lsp_code_actions<CR>", mode = "n", silent = true },
--         { "<leader>fe",       "<cmd>Telescope diagnostics<CR>",      mode = "n", silent = true },
--         { "<leader><leader>", "<cmd>Telescope oldfiles<CR>",         mode = "n", silent = true },
--     },
-- }
