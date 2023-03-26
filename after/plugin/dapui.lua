require("dapui").setup{ mappings = { remove = "b" } }

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

vim.keymap.set("n", "<leader>dui", dapui.toggle, {desc = "Toggle dapui"})
vim.keymap.set("n", "<leader>cdb", function()
    dap.terminate()
    dapui.close()
end)

