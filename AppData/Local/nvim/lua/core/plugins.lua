local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
    end
    return false
  end
  
  local packer_bootstrap = ensure_packer()
  
  return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use "nvim-lua/plenary.nvim"
    use 
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use {"smartpde/telescope-recent-files"}
    use {"nvim-telescope/telescope-fzy-native.nvim"}

    use { 'camspiers/snap' }

    use { "ibhagwan/fzf-lua",
      -- optional for icon support
      requires = { "nvim-tree/nvim-web-devicons" }
    }

    use "lukas-reineke/indent-blankline.nvim"

    use 'eckon/treesitter-current-functions'
    use
    {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
        -- run = function()
        --     local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        --     ts_update()
        -- end,
    }
    use("nvim-treesitter/nvim-treesitter-context")
    use "SmiteshP/nvim-navic"
    use
    {
        "williamboman/mason.nvim",
        run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    }
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'


    use('ThePrimeagen/harpoon')
    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    }

    -- use('Bekaboo/dropbar.nvim')
    -- use {
    --   "kevinhwang91/nvim-hlslens",
    --   config = function()
    --     -- require('hlslens').setup() is not required
    --     require("scrollbar.handlers.search").setup({
    --         override_lens = function() end,
    --     })
    --   end,
    -- }
    -- use 'karb94/neoscroll.nvim'
    -- use "petertriho/nvim-scrollbar"
    use 'dstein64/nvim-scrollview'
    -- use 'justinmk/vim-sneak'

    use("mbbill/undotree")

    use 'nanozuki/tabby.nvim'
    use 'romgrk/barbar.nvim'
    use {
        'LukasPietzschmann/telescope-tabs',
        requires = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require'telescope-tabs'.setup{
                -- Your custom config :^)
            }
        end
    }
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.1.1", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })
    -- use 'hrsh7th/cmp-vsnip'
    -- use 'hrsh7th/vim-vsnip'
     -- use 'dcampos/nvim-snippy'
     -- use 'dcampos/cmp-snippy'

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    }
    use {
      'tzachar/local-highlight.nvim',
  }


    -- use {
    --   "smjonas/inc-rename.nvim",
    --   config = function()
    --     require("inc_rename").setup()
    --   end,
    -- }

    -- use {
    --     "p00f/clangd_extensions.nvim"
    -- }

    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
    -- use "sindrets/diffview.nvim" 
    use 'lvimuser/lsp-inlayhints.nvim'
    -- use 'rhysd/vim-clang-format'
    -- use 'mhartington/formatter.nvim'

    -- use 'RRethy/vim-illuminate'
    use 'simrat39/symbols-outline.nvim'


    use {'Mofiqul/vscode.nvim', as = "vscode"}
    use {"ful1e5/onedark.nvim", as = "onedark" }
    use { "bluz71/vim-moonfly-colors", as = "moonfly" }
    use { "jacoborus/tender.vim", as = "tender" }
    use { "sainnhe/everforest" }
    use "rebelot/kanagawa.nvim"
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end)
