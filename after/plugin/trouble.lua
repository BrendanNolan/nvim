require("trouble").setup{
    icons = false,  -- Couldn't install the required devicons for some reason
}

vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<CR>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>rt", "<cmd>TroubleRefresh<CR>",
  {silent = true, noremap = true}
)

