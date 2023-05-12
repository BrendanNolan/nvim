local builtin = require('telescope.builtin')

-- Lsp
vim.keymap.set('n', '<leader>rf', builtin.lsp_references, {desc = "Telescope show lsp refs"})
vim.keymap.set('n', '<leader>tds', builtin.lsp_document_symbols, {desc = "Telescope show document symbols"})
vim.keymap.set('n', '<leader>tws', builtin.lsp_workspace_symbols, {desc = "Telescope show workspace symbols"})

-- File Finding
-- vim.keymap.set('n', '<leader>pf', builtin.find_files)
vim.keymap.set('n', '<leader>ff', builtin.git_files)  -- File Find

-- Text Finding
vim.keymap.set('n', '<leader>fs', function() builtin.current_buffer_fuzzy_find({fuzzy=false}) end)  -- Buffer Find. Note that we need nvim-telescope/telescope-fzf-native.nvim in order to use {fuzzy=false}
vim.keymap.set('n', '<leader>fbf', builtin.current_buffer_fuzzy_find)  -- Fuzzy Buffer Find
vim.keymap.set('n', '<leader>gf', builtin.live_grep)  -- Global Find
vim.keymap.set('n', '<leader>fgf', function() builtin.grep_string{ shorten_path = true, word_match = "-w", only_sort_text = true, search = '' } end)  -- Fuzzy Global Find
vim.keymap.set('n', '<leader>cwf', builtin.grep_string)  -- Current Word Find: find word under cursor (non fuzzy)
vim.keymap.set('n', '<leader>fw', function()
        builtin.grep_string({ search = vim.fn.input("grep > ") })
    end,
    {desc = "Find Word (prompt appears) (not fuzzy)"})

vim.keymap.set('n', '<leader>tr', builtin.resume)

vim.keymap.set('n', '<leader>tkm', builtin.keymaps)

vim.keymap.set('n', '<leader>tb', function() builtin.buffers({sort_mru=true}) end)

require('telescope').setup{
    defaults = require("telescope.themes").get_dropdown(
        {layout_config = { width = 120 }, shorten_path = true}
    )
}

require('telescope').load_extension('fzf')

