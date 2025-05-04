return {
    'ibhagwan/fzf-lua',
    lazy = false,
    opts = {
        fzf_colors = true,
        hls = {
            border     = "FloatBorder",
            -- cursor       = 'Error',     -- cursor highlight
            cursorline = 'Visual', -- cursor line highlight
        },
        -- ...other options as needed...
    },
    config = function(_, opts)
        require('fzf-lua').setup(opts)
    end,
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
