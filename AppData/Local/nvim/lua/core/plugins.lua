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
  "coffebar/neovim-project",
  opts = {
    projects = { -- define project roots
      "~/projects/*",
      "~/.config/*",
    },
  },
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
},

     'wbthomason/packer.nvim',
    -- My plugins here
    --  'foo1/bar1.nvim'
    --  'foo2/bar2.nvim'
     'nvim-tree/nvim-tree.lua',
     'nvim-tree/nvim-web-devicons',
    
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
     "nvim-lua/plenary.nvim",
     
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
     {"smartpde/telescope-recent-files"},
     {"nvim-telescope/telescope-fzy-native.nvim"},

     { "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

     'eckon/treesitter-current-functions',
    
    {
        'nvim-treesitter/nvim-treesitter',
    },
    "nvim-treesitter/nvim-treesitter-context",
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

    -- ('Bekaboo/dropbar.nvim')
    --  {
    --   "kevinhwang91/nvim-hlslens",
    --   config = function()
    --     -- require('hlslens').setup() is not required
    --     require("scrollbar.handlers.search").setup({
    --         override_lens = function() end,
    --     })
    --   end,
    -- }
    --  'karb94/neoscroll.nvim'
    --  "petertriho/nvim-scrollbar"
     'dstein64/nvim-scrollview',
    --  'justinmk/vim-sneak'

    "mbbill/undotree",

     'nanozuki/tabby.nvim',
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
    --  'hrsh7th/cmp-vsnip'
    --  'hrsh7th/vim-vsnip'
     --  'dcampos/nvim-snippy'
     --  'dcampos/cmp-snippy'

    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
     {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    },
     {
      'tzachar/local-highlight.nvim'
  },

  {
    "Pocco81/auto-save.nvim",
    config = function()
         require("auto-save").setup {
            condition = function(buf)
                if vim.bo[buf].filetype == "harpoon" then
                    return false
                end
            end
                -- your config goes here
            -- or just leave it empty :)
         }
    end,
  },

    --  {
    --   "smjonas/inc-rename.nvim",
    --   config = function()
    --     require("inc_rename").setup()
    --   end,
    -- }

    --  {
    --     "p00f/clangd_extensions.nvim"
    -- }

    -- ({
    --     "kdheepak/lazygit.nvim",
    --     -- optional for floating window border decoration
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --     },
    -- })
    --  "sindrets/diffview.nvim" 
    --  'lvimr/lsp-inlayhints.nvim',
    --  'rhysd/vim-clang-format'
    --  'mhartington/formatter.nvim'

    --  'RRethy/vim-illuminate'
     'simrat39/symbols-outline.nvim',


     {'Mofiqul/vscode.nvim', as = "vscode"},
     {"ful1e5/onedark.nvim", as = "onedark" },
     { "bluz71/vim-moonfly-colors", as = "moonfly" },
     { "jacoborus/tender.vim", as = "tender" },
     { "sainnhe/everforest" },
     "rebelot/kanagawa.nvim"

}
)
  -- 
  -- return require('packer').startup(function(use)
  --   use 'wbthomason/packer.nvim'
  --   -- My plugins here
  --   -- use 'foo1/bar1.nvim'
  --   -- use 'foo2/bar2.nvim'
  --   use 'nvim-tree/nvim-tree.lua'
  --   use 'nvim-tree/nvim-web-devicons'
  --   use
  --   {
  --       'nvim-lualine/lualine.nvim',
  --       requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  --   }
  --   use "nvim-lua/plenary.nvim"
  --   use 
  --   {
  --       'nvim-telescope/telescope.nvim', tag = '0.1.4',
  --       requires = { {'nvim-lua/plenary.nvim'} }
  --   }
  --   use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  --   use {"smartpde/telescope-recent-files"}
  --   use {"nvim-telescope/telescope-fzy-native.nvim"}
  --
  --   use { "ibhagwan/fzf-lua",
  --     -- optional for icon support
  --     requires = { "nvim-tree/nvim-web-devicons" }
  --   }
  --
  --   use "lukas-reineke/indent-blankline.nvim"
  --
  --   use 'eckon/treesitter-current-functions'
  --   use
  --   {
  --       'nvim-treesitter/nvim-treesitter',
  --       run = ":TSUpdate"
  --       -- run = function()
  --       --     local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
  --       --     ts_update()
  --       -- end,
  --   }
  --   use("nvim-treesitter/nvim-treesitter-context")
  --   use "SmiteshP/nvim-navic"
  --   use
  --   {
  --       "williamboman/mason.nvim",
  --       run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  --   }
  --   use 'neovim/nvim-lspconfig'
  --   use 'hrsh7th/cmp-nvim-lsp'
  --   use 'hrsh7th/cmp-buffer'
  --   use 'hrsh7th/cmp-path'
  --   use 'hrsh7th/cmp-cmdline'
  --   use 'hrsh7th/nvim-cmp'
  --   use 'hrsh7th/cmp-nvim-lsp-signature-help'
  --
  --   use {
  --       "ThePrimeagen/harpoon",
  --       branch = "harpoon2",
  --       requires = { {"nvim-lua/plenary.nvim"} }
  --   }
  --   use {
  --       "ThePrimeagen/refactoring.nvim",
  --       requires = {
  --           {"nvim-lua/plenary.nvim"},
  --           {"nvim-treesitter/nvim-treesitter"}
  --       }
  --   }
  --
  --   -- use('Bekaboo/dropbar.nvim')
  --   -- use {
  --   --   "kevinhwang91/nvim-hlslens",
  --   --   config = function()
  --   --     -- require('hlslens').setup() is not required
  --   --     require("scrollbar.handlers.search").setup({
  --   --         override_lens = function() end,
  --   --     })
  --   --   end,
  --   -- }
  --   -- use 'karb94/neoscroll.nvim'
  --   -- use "petertriho/nvim-scrollbar"
  --   use 'dstein64/nvim-scrollview'
  --   -- use 'justinmk/vim-sneak'
  --
  --   use("mbbill/undotree")
  --
  --   use 'nanozuki/tabby.nvim'
  --   use 'romgrk/barbar.nvim'
  --   use {
  --       'LukasPietzschmann/telescope-tabs',
  --       requires = { 'nvim-telescope/telescope.nvim' },
  --       config = function()
  --           require'telescope-tabs'.setup{
  --               -- Your custom config :^)
  --           }
  --       end
  --   }
  --   use({
  --       "L3MON4D3/LuaSnip",
  --       -- follow latest release.
  --       tag = "v2.1.1", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  --       -- install jsregexp (optional!:).
  --       run = "make install_jsregexp"
  --   })
  --   -- use 'hrsh7th/cmp-vsnip'
  --   -- use 'hrsh7th/vim-vsnip'
  --    -- use 'dcampos/nvim-snippy'
  --    -- use 'dcampos/cmp-snippy'
  --
  --   use {
  --       'numToStr/Comment.nvim',
  --       config = function()
  --           require('Comment').setup()
  --       end
  --   }
  --   use {
  --     'phaazon/hop.nvim',
  --     branch = 'v2', -- optional but strongly recommended
  --     config = function()
  --       -- you can configure Hop the way you like here; see :h hop-config
  --       require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  --     end
  --   }
  --   use {
  --     'tzachar/local-highlight.nvim',
  -- }
  --
  --
  --   -- use {
  --   --   "smjonas/inc-rename.nvim",
  --   --   config = function()
  --   --     require("inc_rename").setup()
  --   --   end,
  --   -- }
  --
  --   -- use {
  --   --     "p00f/clangd_extensions.nvim"
  --   -- }
  --
  --   use({
  --       "kdheepak/lazygit.nvim",
  --       -- optional for floating window border decoration
  --       requires = {
  --           "nvim-lua/plenary.nvim",
  --       },
  --   })
  --   -- use "sindrets/diffview.nvim" 
  --   use 'lvimuser/lsp-inlayhints.nvim'
  --   -- use 'rhysd/vim-clang-format'
  --   -- use 'mhartington/formatter.nvim'
  --
  --   -- use 'RRethy/vim-illuminate'
  --   use 'simrat39/symbols-outline.nvim'
  --
  --
  --   use {'Mofiqul/vscode.nvim', as = "vscode"}
  --   use {"ful1e5/onedark.nvim", as = "onedark" }
  --   use { "bluz71/vim-moonfly-colors", as = "moonfly" }
  --   use { "jacoborus/tender.vim", as = "tender" }
  --   use { "sainnhe/everforest" }
  --   use "rebelot/kanagawa.nvim"
  --   -- Automatically set up your configuration after cloning packer.nvim
  --   -- Put this at the end after all plugins
  --   if packer_bootstrap then
  --     require('packer').sync()
  --   end
  -- end)
