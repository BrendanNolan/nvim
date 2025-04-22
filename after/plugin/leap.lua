local leap = require('leap')
leap.opts.case_sensitive = false

vim.keymap.set('n', 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-anywhere)')
