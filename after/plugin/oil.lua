require('oil').setup{
  keymaps = { ['gh'] = 'actions.toggle_hidden' },
  skip_confirm_for_simple_edits = true,
}

vim.keymap.set('n', '-', require('oil').open, { desc = 'Open parent directory' })
