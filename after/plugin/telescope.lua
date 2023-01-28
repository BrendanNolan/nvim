local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files)
vim.keymap.set('n', '<leader>gf', builtin.git_files)
vim.keymap.set('n', '<leader>gr', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>lf', builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>lg', builtin.live_grep)
vim.keymap.set('n', '<leader>tr', builtin.resume)


local my_defaults = require("telescope.themes").get_dropdown(
    {layout_config = { width = 120 }, shorten_path = true}
)
my_defaults.initial_mode = 'normal'

require('telescope').setup{
    defaults = my_defaults,
}
