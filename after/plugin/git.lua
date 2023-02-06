-- Fugitive --
vim.keymap.set("n", "<leader>gg", vim.cmd.Git);
--------------

vim.g.floaterm_width = 0.99
vim.g.floaterm_height = 0.99

-- Lazygit --
vim.keymap.set('n', '<leader>lg', '<cmd>FloatermNew lazygit<CR>')
-------------

-- GitUi --
vim.keymap.set('n', '<leader>gu', '<cmd>FloatermNew gitui<CR>')
-------------

