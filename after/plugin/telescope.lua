local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files)
vim.keymap.set('n', '<leader>gf', builtin.git_files)
vim.keymap.set('n', '<leader>gr', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>tr', builtin.resume)

require('telescope').setup{
    defaults = require("telescope.themes").get_dropdown(
        {layout_config = { width = 120 }, shorten_path = true}
    )
}
