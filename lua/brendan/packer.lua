vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
         'nvim-telescope/telescope.nvim', tag = '0.1.1',
	 requires = { {'nvim-lua/plenary.nvim'} }
  }

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

  use('nvim-treesitter/nvim-treesitter', {run = 'TSUpdate'})
  use('nvim-treesitter/nvim-treesitter-textobjects')
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
      }
  }

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use { 'simrat39/rust-tools.nvim', commit = 'b50125d342b7c5b14d331476d0e0bec9b4aebcb7' }
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use { "theHamsta/nvim-dap-virtual-text" }

  use 'p00f/clangd_extensions.nvim'
  use 'ThePrimeagen/vim-be-good'
end)

