-- LSP --
local lsp = require("lspconfig")

require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'rust_analyzer',
    'clangd',
  }
})

vim.diagnostic.config({
    virtual_text = true,
})

-- Completion --
local cmp = require'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

local completion_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Rust Tools --
local rt = require("rust-tools")

local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

rt.setup({
  tools = { autoSetHints = false, inlay_hints = { auto = false },},
  server = {
    on_attach = function(_, bufnr)
      local opts = {buffer = bufnr, remap = false}
      SetupLSPKeymaps(opts)

      vim.keymap.set("n", "<leader>kk", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<leader>aa", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
    capabilities = completion_capabilities,
    cmd = { "rustup", "run", "stable", "rust-analyzer" },
  },
  dap = {
    adapter = require('rust-tools.dap').get_codelldb_adapter(
      codelldb_path, liblldb_path)
  },
})


vim.keymap.set("n", "<leader>rdb", rt.debuggables.debuggables)
vim.keymap.set("n", "<leader>rr", rt.runnables.runnables)

-- Clangd --
require("clangd_extensions").setup({
  server = {
    on_attach = function(_, bufnr)
      local opts = {buffer = bufnr, remap = false}
      SetupLSPKeymaps(opts)
    end,
    capabilities = completion_capabilities, 
  },
})

