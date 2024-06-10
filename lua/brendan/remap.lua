vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pp", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>nn", "o<Esc>o", { desc = 'Insert two new lines and go into insert mode in the second'})
vim.keymap.set("n", "<leader>no", "o<Esc>o<Esc>O", { desc = 'Insert three new lines and go into insert mode in the second'})

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>cc", "b~e", { desc = '[C]hange [C]apitalisation'})
vim.keymap.set("n", "<leader>xx", "bl~e", { desc = 'Change Capitalisation Of Second Character'})

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>flsp", vim.lsp.buf.format)

-- Quickfix --
vim.keymap.set("n", "<leader>co", "<cmd>copen<CR>zz")
vim.keymap.set("n", "<Left>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<Right>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>ln", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>lp", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>sb", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>px", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>pw", "<cmd>!chmod +w %<CR>", { silent = true })

-- Split Windows
vim.keymap.set("n", "<leader>hs", "<cmd>split<CR>")
vim.keymap.set("n", "<leader>vs", "<cmd>vsplit<CR>")

-- Navigate Windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize Windows
vim.keymap.set("n", "<C-Left>", "5<C-w><")
vim.keymap.set("n", "<C-Right>", "5<C-w>>")
vim.keymap.set("n", "<C-Up>", "5<C-w>+")
vim.keymap.set("n", "<C-Down>", "5<C-w>-")

-- Disable Up And Down Arrow Keys
vim.keymap.set({'n', 'i', 'v', 'x'}, "<Up>", "<nop>")
vim.keymap.set({'n', 'i', 'v', 'x'}, "<Down>", "<nop>")

-- Closing Other Windows --
vim.keymap.set("n", "<leader>o", "<cmd>on<CR>", { desc = "Make current window only window." })

-- Format Code --
local format_current_buffer = function()
    local ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local file_path = vim.api.nvim_buf_get_name(0)
    if ft == 'rust' then
        vim.api.nvim_command("silent !cargo +nightly fmt -- " .. file_path)
        vim.api.nvim_echo({{'Formatted Rust Code'}}, false, {})
    elseif ft == 'cpp' then
        vim.api.nvim_command("silent !clang-format -i " .. file_path)
        vim.api.nvim_echo({{'Formatted CPP Code'}}, false, {})
    end
end

vim.keymap.set('n', '<leader>fmt', format_current_buffer)

vim.keymap.set('n', '<leader>cfp', "<cmd>let @+ = expand('%:p')<CR>", { desc = "Copy full path of current buffer to system clipboard" })
vim.keymap.set('n', '<leader>crp', "<cmd>let @+ = expand('%')<CR>", { desc = "Copy relative path of current buffer to system clipboard" })

vim.keymap.set('n', '<leader>;', 'A;<Esc>', {desc = "Put semicolon at end of line"})
vim.keymap.set('n', '<leader>cs', 'A<Space>{<CR><CR>}<Esc>ki<Tab>', {desc = 'Curly Scope: open scope braces'})
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', {desc = "Write"})
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', {desc = "Quit"})
vim.keymap.set('n', '<leader>ct', function()
    vim.cmd.checktime()
    vim.api.nvim_echo({ { 'Ran checktime' } }, false, {})
end, {desc = "checktime"})
vim.keymap.set('n', '<leader>cx', function()
    vim.api.nvim_echo({ { '' } }, false, {})
end, {desc = "Clear command text"})

vim.keymap.set('n',
    '<leader>cgo',
    function()
        vim.cmd('compiler cargo')
        vim.api.nvim_echo({{'Set make command to use cargo'}}, false, {})
    end,
    {desc = 'Set make command to use cargo'})

vim.keymap.set('n', '<leader>ll', '<cmd>ls<CR>', {desc = ':ls'})

vim.keymap.set('n', '<leader>nb', '<cmd>bnext<CR>', {desc = 'Next Buffer'})
vim.keymap.set('n', '<leader>pb', '<cmd>bprevious<CR>', {desc = 'Previous Buffer'})

-- Put current function/class at top of file
-- Uses recursive mapping to lalow use of existing '[f' and '[c' treesitter mappings
-- These commands begin with l because for some reason, having the cursor at col 0 at the
-- beginning of the function/class will result in the previous function/class being put
-- at the top of the file.
vim.api.nvim_set_keymap('n', '<leader>fu', 'l[fz<CR>', { noremap = false, desc = 'Put current function at top of file'})
vim.api.nvim_set_keymap('n', '<leader>su', 'l[sz<CR>', { noremap = false, desc = 'Put current class at top of file'})

vim.keymap.set('n', '<leader><leader>', 'z<CR>', {desc="Move cursor line to top of screen"})

vim.keymap.set('n',
    '<leader>hsy',
    function()
        vim.opt.hlsearch = true
    end,
    {desc = 'Set search highlighting'})
vim.keymap.set('n',
    '<leader>hsn',
    function()
        vim.opt.hlsearch = false
    end,
    {desc = 'Unset search highlighting'})
