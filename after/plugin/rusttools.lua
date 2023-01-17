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

      vim.keymap.set("n", "kk", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "aa", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
    cmd = { "rustup", "run", "stable", "rust-analyzer" },
  },
  dap = {
    adapter = require('rust-tools.dap').get_codelldb_adapter(
      codelldb_path, liblldb_path)
  },
})


vim.keymap.set("n", "<leader>rdb", rt.debuggables.debuggables)
vim.keymap.set("n", "<leader>rr", rt.runnables.runnables)

