require("portal").setup{}

vim.keymap.set("n", "<leader>jo", "<cmd>Portal jumplist backward<cr>")
vim.keymap.set("n", "<leader>ji", "<cmd>Portal jumplist forward<cr>")

