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

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = require('lsp-zero').defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

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
    capabilities = cmp_mappings,
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
    capabilities = cmp_mappings,
  },
})

