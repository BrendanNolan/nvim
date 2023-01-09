local rt = require("rust-tools")

rt.setup({
  tools = { autoSetHints = false, inlay_hints = { auto = false },},
  server = {
    on_attach = function(_, bufnr)
      local opts = {buffer = bufnr, remap = false}
      Setup_LSP_Keymaps(opts)
    end,
    cmd = { "rustup", "run", "stable", "rust-analyzer" },
  },
})

