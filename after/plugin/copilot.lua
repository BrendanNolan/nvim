vim.api.nvim_command('Copilot setup')

vim.keymap.set("n", "<leader>cpe", "<cmd>Copilot enable<cr>")
vim.keymap.set("n", "<leader>cpd", "<cmd>Copilot disable<cr>")
