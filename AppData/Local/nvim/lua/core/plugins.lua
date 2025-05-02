local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
  
require('lazy').setup(
{
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {

            -- See Configuration section for options
        },
        keys = {
            { "<leader>zc", ":CopilotChatToggle<CR>", mode = "n" },
            { "<leader>ze", ":CopilotChatExplain<CR>", mode = "v" },
            { "<leader>zf", ":CopilotChatFix<CR>", mode = "v" },
        },
    -- See Commands section for default commands if you want to lazy load on them
    },
    { "zbirenbaum/copilot.vim"},

    {'kevinhwang91/promise-async'},

    {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async'},
    {'nvim-tree/nvim-tree.lua'},
    {'nvim-tree/nvim-web-devicons'},
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        config = true,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },

    {"nvim-lua/plenary.nvim"},
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    { "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

     'eckon/treesitter-current-functions',
    
    {
        'nvim-treesitter/nvim-treesitter',
    },
    -- "nvim-treesitter/nvim-treesitter-context",
     "SmiteshP/nvim-navic",
    
    {
        "williamboman/mason.nvim"
    },
     'neovim/nvim-lspconfig',
     'hrsh7th/cmp-nvim-lsp',
     'hrsh7th/cmp-buffer',
     'hrsh7th/cmp-path',
     'hrsh7th/cmp-cmdline',
     'hrsh7th/nvim-cmp',
     'hrsh7th/cmp-nvim-lsp-signature-help',

     {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { {"nvim-lua/plenary.nvim"} }
    },
     {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    },


    {'dstein64/nvim-scrollview'},

    "mbbill/undotree",

     'romgrk/barbar.nvim',
    {
        'LukasPietzschmann/telescope-tabs',
        config = function()
            require('telescope').load_extension 'telescope-tabs'
            require('telescope-tabs').setup {
                -- Your custom config :^)
            }
        end,
        dependencies = { 'nvim-telescope/telescope.nvim' },
    },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        -- build = "make install_jsregexp"
    },

    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        -- log_level = 'debug',
    }
    },

    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    --  {
    --   'phaazon/hop.nvim',
    --   branch = 'v2', -- optional but strongly recommended
    --   config = function()
    --     -- you can configure Hop the way you like here; see :h hop-config
    --     require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    --   end
    -- },
    {
      'tzachar/local-highlight.nvim'
    },

--   {
--     "Pocco81/auto-save.nvim",
--     config = function()
--          require("auto-save").setup {
--             condition = function(buf)
--                 if vim.bo[buf].filetype == "harpoon" then
--                     return false
--                 end
--             end
--                 -- your config goes here
--             -- or just leave it empty :)
--          }
--     end,
--   },

  {'simrat39/symbols-outline.nvim'},

    -- {
    --     'rmccord7/p4.nvim',
    --     dependencies = {'nvim-telescope/telescope.nvim'},
    --     opts = {
    --     -- your configuration comes here
    --     -- or leave it empty to use the default settings
    --     -- refer to the configuration section below
    --     }
    -- },


     {'Mofiqul/vscode.nvim', as = "vscode"},
     {"ful1e5/onedark.nvim", as = "onedark" },
     { "bluz71/vim-moonfly-colors", as = "moonfly" },
     { "jacoborus/tender.vim", as = "tender" },
     { "sainnhe/everforest" },
     "rebelot/kanagawa.nvim",

     -- Color scheme
    {
        'ribru17/bamboo.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('bamboo').setup {
            -- optional configuration here
            }
            require('bamboo').load()
        end,
    },

}
)
