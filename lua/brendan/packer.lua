vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    -- Completion --
    use {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'onsails/lspkind-nvim',
    }

    -- Snippets --
    use {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use { "ellisonleao/gruvbox.nvim" }
    use { "Mofiqul/vscode.nvim" }
    use { "chriskempson/base16-vim" }
    use { "jacoborus/tender.vim" }
    use 'Mofiqul/dracula.nvim'

    use('nvim-treesitter/nvim-treesitter', { run = 'TSUpdate' })
    use('nvim-treesitter/nvim-treesitter-textobjects')
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use { 'simrat39/rust-tools.nvim', commit = 'b50125d342b7c5b14d331476d0e0bec9b4aebcb7' }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use { "theHamsta/nvim-dap-virtual-text" }

    -- Extension To Set Up Clangd Language Server --
    use 'p00f/clangd_extensions.nvim'

    -- Vim Motions Practice Game --
    use 'ThePrimeagen/vim-be-good'

    -- Folding --
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

    -- Auto Pairs --
    use {'windwp/nvim-autopairs'}

    -- Error Displayer --
    use { "folke/trouble.nvim" }  -- Docs say to require web-devicons but that didn't work for me.

    -- Floating Terminal --
    use 'voldikss/vim-floaterm'
    -----------------------

    -- vim-test --
    use 'vim-test/vim-test'
    --------------

end)
