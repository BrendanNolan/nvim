require('oil').setup{ keymaps = { ['gh'] = 'actions.toggle_hidden' } }

vim.keymap.set('n', '-', require('oil').open, { desc = 'Open parent directory' })
