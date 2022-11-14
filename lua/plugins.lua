return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  use 'junegunn/fzf'

  use 'BurntSushi/ripgrep'
  use 'nvim-telescope/telescope-file-browser.nvim'
  --
  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- colorscheme
  use 'folke/tokyonight.nvim'
  use 'nanotech/jellybeans.vim'
  use 'catppuccin/nvim'
  use 'bluz71/vim-moonfly-colors'
  use {'dracula/vim', as = 'dracula'}
  use 'cocopon/iceberg.vim'
  use 'rebelot/kanagawa.nvim'

  -- Bufferline
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

  -- cmp-nvim
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- mason.nvim
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  }

  use 'L3MON4D3/LuaSnip'

  -- buffdelete
    -- use 'famiu/bufdelete.nvim'

  -- Comentaries!! 
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Terminal
  use "akinsho/toggleterm.nvim"



  -- friendly-snippets
  use "rafamadriz/friendly-snippets"


  -- treesiter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  use 'ThePrimeagen/harpoon'

  -- autopairs
  use "jiangmiao/auto-pairs"

  use "tpope/vim-surround"

  use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }

  use {
      "windwp/nvim-ts-autotag",
      config = function() require("nvim-ts-autotag").setup {} end
  }

  -- use "godlygeek/tabular"

    -- use "mg979/vim-visual-multi"

  use "ThePrimeagen/vim-be-good"

  use "glepnir/lspsaga.nvim"

  use "jose-elias-alvarez/null-ls.nvim" -- null-ls
  use 'MunifTanjim/prettier.nvim' -- Prettier

  use "lewis6991/gitsigns.nvim"

  use 'folke/which-key.nvim'
end)
