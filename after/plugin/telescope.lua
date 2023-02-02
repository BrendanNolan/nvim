local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>tr', builtin.resume)

-- File Finding
-- vim.keymap.set('n', '<leader>pf', builtin.find_files)
vim.keymap.set('n', '<leader>ff', builtin.git_files)  -- File Find

-- Text Finding

-- Buffer Find. Will be fuzzy by default - prefix search string with ' to make it nonfuzzy
-- This non-fuzzy syntax relies on the nvim-telescope/telescope-fzf-native.nvim plugin.
vim.keymap.set('n', '<leader>bf', builtin.current_buffer_fuzzy_find)


-- Global Find. Will be fuzzy by default - prefix search string with ' to make it nonfuzzy
-- This non-fuzzy syntax relies on the nvim-telescope/telescope-fzf-native.nvim plugin.
vim.keymap.set('n', '<leader>gf', function()
    builtin.grep_string{
        shorten_path = true,
        word_match = "-w",
        only_sort_text = true,
        search = '' }
end)

-- Word Find: find word under cursor (non fuzzy)
vim.keymap.set('n', '<leader>wf', builtin.grep_string)

require('telescope').setup{
    defaults = require("telescope.themes").get_dropdown(
        {layout_config = { width = 120 }, shorten_path = true}
    )
}

require('telescope').load_extension('fzf')

