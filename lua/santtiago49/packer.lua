vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope for fuzzy finding
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = {
            'nvim-lua/plenary.nvim',
            'folke/trouble.nvim'
        }
    }

    -- Colorscheme
    use { 'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end }

    -- Treesitter for syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- Other utilities
    use { 'ThePrimeagen/harpoon' }
    use { 'mbbill/undotree' }
    use { 'tpope/vim-fugitive' }

    -- LSP and Autocompletion Setup
    use { 'neovim/nvim-lspconfig' }             -- Core LSP configuration
    use { 'hrsh7th/nvim-cmp' }                  -- Completion engine
    use { 'hrsh7th/cmp-nvim-lsp' }              -- LSP completion source for nvim-cmp
    use { 'hrsh7th/cmp-buffer' }                -- Buffer completion source
    use { 'hrsh7th/cmp-path' }                  -- Path completion source
    use { 'hrsh7th/cmp-cmdline' }               -- Command-line completion
    use { 'L3MON4D3/LuaSnip' }                  -- Snippet engine
    use { 'saadparwaiz1/cmp_luasnip' }          -- Snippet completions
    use { 'williamboman/mason.nvim' }           -- LSP installer
    use { 'williamboman/mason-lspconfig.nvim' } -- Bridge between mason and lspconfig
    use { 'stevearc/conform.nvim' }             -- Formatter
    use { 'j-hui/fidget.nvim' }                 -- LSP status UI


    -- sql editor
    use { "tpope/vim-dadbod" }
    use { "kristijanhusak/vim-dadbod-completion" }
    use { "kristijanhusak/vim-dadbod-ui" }

    -- toggle term
    use {"akinsho/toggleterm.nvim"}


    use {
        "d7omdev/nuget.nvim",
        config = function()
            require("nuget").setup()
        end,
    }

    -- trouble.nvim
    use {
      'folke/trouble.nvim',
      requires = 'nvim-tree/nvim-web-devicons',
      config = function()
        require("trouble").setup()
      end
    }

    -- lsp colors
    use { 'folke/lsp-colors.nvim' }
    use { 'nvimdev/lspsaga.nvim' }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

end)
