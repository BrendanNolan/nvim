local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<A-a>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<A-s>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<A-d>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<A-f>", function() ui.nav_file(4) end)

