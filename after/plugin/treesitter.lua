require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "javascript", "typescript", "c", "cpp", "lua", "rust", "markdown", "markdown_inline" , "latex"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      disable = function(_, bufnr)  -- Disable in treesitter-refactor in large buffers
        return vim.api.nvim_buf_line_count(bufnr) > 1000
      end,
      clear_on_cursor_move = true,  -- Set to false if you have an `updatetime` of ~100
    },
  },
  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]s"] = "@class.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[s"] = "@class.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["]a"] = "@parameter.inner",
      },
      swap_previous = {
        ["[a"] = "@parameter.inner",
      },
    },
  },
}

require'treesitter-context'.setup{}
-- Make context background grey
vim.cmd("hi TreesitterContext guibg=Grey")

