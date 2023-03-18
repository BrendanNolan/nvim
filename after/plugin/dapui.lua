require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

vim.keymap.set("n", "<leader>dui", dapui.open, {desc = "Open dapui"})
vim.keymap.set("n", "<leader>cdb", function()
    dap.terminate()
    dapui.close()
end)

