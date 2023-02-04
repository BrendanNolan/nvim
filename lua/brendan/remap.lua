vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>cc", "b~e", { desc = '[C]hange [C]apitalisation'})
vim.keymap.set("n", "<leader>xx", "bl~e", { desc = 'Change Capitalisation Of Second Character'})

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quickfix --
vim.keymap.set("n", "<leader>co", "<cmd>copen<CR>zz")
vim.keymap.set("n", "<leader>cn", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>cp", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>ln", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>lp", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Make split resizing easier
vim.keymap.set("n", "<leader>.", "10<C-w>>")
vim.keymap.set("n", "<leader>,", "10<C-w><")

-- Disable arrow keys
vim.keymap.set({'n', 'i', 'v', 'x'}, "<Left>", "<nop>")
vim.keymap.set({'n', 'i', 'v', 'x'}, "<Right>", "<nop>")
vim.keymap.set({'n', 'i', 'v', 'x'}, "<Up>", "<nop>")
vim.keymap.set({'n', 'i', 'v', 'x'}, "<Down>", "<nop>")

-- Navigate Windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Format Code --
local format_current_buffer = function()
    local ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local file_path = vim.api.nvim_buf_get_name(0)
    if ft == 'rust' then
        vim.api.nvim_command("silent !cargo +nightly fmt -- " .. file_path)
    elseif ft == 'cpp' then
        vim.api.nvim_command("silent !clang-format -i " .. file_path)
    end
end

vim.keymap.set('n', '<leader>fmt', format_current_buffer)

