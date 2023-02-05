local fterm = require("FTerm")

local gitui = fterm:new({
    ft = 'fterm_gitui', -- You can also override the default filetype, if you want
    cmd = "gitui",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

-- Toggle gitui in a floating terminal --
vim.keymap.set('n', '<leader>gu', function()
    gitui:toggle()
end)
-----------------------------------------

-- Open Fugitive --
vim.keymap.set("n", "<leader>gg", vim.cmd.Git);
-------------------

