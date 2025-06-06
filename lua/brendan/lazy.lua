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

local plugins = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jay-babu/mason-nvim-dap.nvim",

    -- Completion --
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'onsails/lspkind-nvim',


    -- Snippets --
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-live-grep-args.nvim' }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },

     "ellisonleao/gruvbox.nvim",
     "Mofiqul/vscode.nvim",
     "chriskempson/base16-vim",
     "jacoborus/tender.vim",
    'Mofiqul/dracula.nvim',
     "loctvl842/monokai-pro.nvim",
     'tanvirtin/monokai.nvim',
     'eldritch-theme/eldritch.nvim',

     {'nvim-treesitter/nvim-treesitter',  build = ':TSUpdate'},
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-refactor',
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = 'nvim-treesitter/nvim-treesitter'
    },
    'nvim-treesitter/playground',

    {'theprimeagen/harpoon'},
    {'mbbill/undotree'},
    {'tpope/vim-fugitive'},
    {'lewis6991/gitsigns.nvim'},

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },

     'simrat39/rust-tools.nvim',
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
     "theHamsta/nvim-dap-virtual-text",

    -- Vim Motions Practice Game --
    'ThePrimeagen/vim-be-good',

    -- Folding --
    {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async'},

    -- Auto Pairs --
    'windwp/nvim-autopairs',

    -- Error Displayer --
     "folke/trouble.nvim",   -- Docs say to require web-devicons but that didn't work for me.

    -- Floating Terminal --
    'voldikss/vim-floaterm',
    -----------------------

    -- vim-test --
    'vim-test/vim-test',
    --------------

    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig"
    },

     "kylechui/nvim-surround",

    'nvim-tree/nvim-web-devicons',

    'simrat39/symbols-outline.nvim',

    {
        "cbochs/portal.nvim",
        -- Optional dependencies
        dependencies = {
            "cbochs/grapple.nvim",
            "theprimeagen/harpoon",
        },
    },

     "tpope/vim-obsession",

     "stevearc/oil.nvim",

     "tpope/vim-sleuth",

    {
        'MeanderingProgrammer/markdown.nvim',
        name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
        dependencies = { 'nvim-treesitter' },
        config = function()
            require('render-markdown').setup({})
        end,
    },

    "ggandor/leap.nvim",

    "sindrets/diffview.nvim",
}

local opts = {}

require('lazy').setup(plugins, opts)
