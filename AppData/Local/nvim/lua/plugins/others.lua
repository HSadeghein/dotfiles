return
{
    { 'kevinhwang91/promise-async' },

    { 'kevinhwang91/nvim-ufo',      dependencies = 'kevinhwang91/promise-async' },
    { 'nvim-tree/nvim-web-devicons' },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        config = true,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },

    { "nvim-lua/plenary.nvim" },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "miversen33/sunglasses.nvim", config = true
    },

    "SmiteshP/nvim-navic",
    { 'echasnovski/mini.icons' },

    { "williamboman/mason-lspconfig.nvim" },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()
            -- require("mason-lspconfig").setup_handlers({
            --     handlers = {
            --         function(server_name)
            --             require("lspconfig")[server_name].setup({})
            --         end,
            --     }
            -- })
        end
    },

    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        -- build = "make install_jsregexp"
    },
    -- {
    --     'rmagatti/auto-session',
    --     lazy = false,

    --     config = function()
    --         require('auto-session').setup {
    --             log_level = 'error',
    --             auto_session_enable_last_session = false,
    --             auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
    --             auto_session_enabled = true,
    --             auto_save_enabled = true,
    --             auto_restore_enabled = false, -- We'll handle restoration via dashboard
    --             auto_session_suppress_dirs = nil,
    --         }
    --     end,
    --     opts = {
    --         suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    --         -- log_level = 'debug',
    --     }
    -- },
    {
        "gennaro-tedesco/nvim-possession",
        dependencies = {
            "ibhagwan/fzf-lua",
        },
        config = true,
        keys = {
            { "<leader>sl", function() require("nvim-possession").list() end, desc = "📌list sessions", },
            { "<leader>sn", function() require("nvim-possession").new() end, desc = "📌create new session", },
            { "<leader>su", function() require("nvim-possession").update() end, desc = "📌update current session", },
            { "<leader>sd", function() require("nvim-possession").delete() end, desc = "📌delete selected session" },
        },
    }
}
