local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({shorten_path = true})
end)
vim.keymap.set('n', '<leader>gf', function()
    builtin.git_files({shorten_path = true})
end)
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > "), shorten_path = true })
end)
vim.keymap.set('n', '<leader>tr', builtin.resume)

