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
  -- The textobjects create a weird bug, if you are in visual block mode and you press 'l', say,
  -- five times, then the fifth rightward move of the selection will take a long time. The issue
  -- disappears if you comment out the textobjects section.
  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]i="] = "@assignment.inner",
        ["]l="] = "@assignment.lhs",
        ["]="] = "@assignment.outer",
        ["]r="] = "@assignment.rhs",
        ["]ib"] = "@block.inner",
        ["]b"] = "@block.outer",
        ["]ic"] = "@call.inner",
        ["]fc"] = "@call.outer",
        ["]is"] = "@class.inner",
        ["]s"] = "@class.outer",
        ["]iq"] = "@comment.inner",
        ["]q"] = "@comment.outer",
        ["]ii"] = "@conditional.inner",
        ["]i"] = "@conditional.outer",
        ["]if"] = "@function.inner",
        ["]f"] = "@function.outer",
        ["]il"] = "@loop.inner",
        ["]l"] = "@loop.outer",
        ["]in"] = "@number.inner",
        ["]a"] = "@parameter.inner",
        ["]aa"] = "@parameter.outer",
        ["]ip"] = "@regex.inner",
        ["]p"] = "@regex.outer",
        ["]r"] = "@return.inner",
        ["]ar"] = "@return.outer",
        ["]-"] = { query = "@local.scope", query_group = "locals" },
        ["]z"] = { query = "@fold", query_group = "folds" },
        ["]t"] = "@statement.outer",
      },
      goto_next_end = {
        ["]]i="] = "@assignment.inner",
        ["]]l="] = "@assignment.lhs",
        ["]]="] = "@assignment.outer",
        ["]]r="] = "@assignment.rhs",
        ["]]ib"] = "@block.inner",
        ["]]b"] = "@block.outer",
        ["]]ic"] = "@call.inner",
        ["]]c"] = "@call.outer",
        ["]]is"] = "@class.inner",
        ["]]s"] = "@class.outer",
        ["]]iq"] = "@comment.inner",
        ["]]q"] = "@comment.outer",
        ["]]ii"] = "@conditional.inner",
        ["]]i"] = "@conditional.outer",
        ["]]if"] = "@function.inner",
        ["]]f"] = "@function.outer",
        ["]]il"] = "@loop.inner",
        ["]]l"] = "@loop.outer",
        ["]]in"] = "@number.inner",
        ["]]a"] = "@parameter.inner",
        ["]]aa"] = "@parameter.outer",
        ["]]ip"] = "@regex.inner",
        ["]]p"] = "@regex.outer",
        ["]]r"] = "@return.inner",
        ["]]ar"] = "@return.outer",
        ["]]-"] = { query = "@local.scope", query_group = "locals" },
        ["]]z"] = { query = "@fold", query_group = "folds" },
        ["]]t"] = "@statement.outer",
      },
      goto_previous_start = {
        ["[i="] = "@assignment.inner",
        ["[l="] = "@assignment.lhs",
        ["[="] = "@assignment.outer",
        ["[r="] = "@assignment.rhs",
        ["[ib"] = "@block.inner",
        ["[b"] = "@block.outer",
        ["[ic"] = "@call.inner",
        ["[fc"] = "@call.outer",
        ["[is"] = "@class.inner",
        ["[s"] = "@class.outer",
        ["[iq"] = "@comment.inner",
        ["[q"] = "@comment.outer",
        ["[ii"] = "@conditional.inner",
        ["[i"] = "@conditional.outer",
        ["[if"] = "@function.inner",
        ["[f"] = "@function.outer",
        ["[il"] = "@loop.inner",
        ["[l"] = "@loop.outer",
        ["[in"] = "@number.inner",
        ["[a"] = "@parameter.inner",
        ["[aa"] = "@parameter.outer",
        ["[ip"] = "@regex.inner",
        ["[p"] = "@regex.outer",
        ["[r"] = "@return.inner",
        ["[ar"] = "@return.outer",
        ["[-"] = { query = "@local.scope", query_group = "locals" },
        ["[z"] = { query = "@fold", query_group = "folds" },
        ["[t"] = "@statement.outer",
      },
      goto_previous_end = {
        ["[[i="] = "@assignment.inner",
        ["[[l="] = "@assignment.lhs",
        ["[[="] = "@assignment.outer",
        ["[[r="] = "@assignment.rhs",
        ["[[ib"] = "@block.inner",
        ["[[b"] = "@block.outer",
        ["[[ic"] = "@call.inner",
        ["[[c"] = "@call.outer",
        ["[[is"] = "@class.inner",
        ["[[s"] = "@class.outer",
        ["[[iq"] = "@comment.inner",
        ["[[q"] = "@comment.outer",
        ["[[ii"] = "@conditional.inner",
        ["[[i"] = "@conditional.outer",
        ["[[if"] = "@function.inner",
        ["[[f"] = "@function.outer",
        ["[[il"] = "@loop.inner",
        ["[[l"] = "@loop.outer",
        ["[[in"] = "@number.inner",
        ["[[a"] = "@parameter.inner",
        ["[[aa"] = "@parameter.outer",
        ["[[ip"] = "@regex.inner",
        ["[[p"] = "@regex.outer",
        ["[[r"] = "@return.inner",
        ["[[ar"] = "@return.outer",
        ["[[-"] = { query = "@local.scope", query_group = "locals" },
        ["[[z"] = { query = "@fold", query_group = "folds" },
        ["[[t"] = "@statement.outer",
      },
    },
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        ["i="] = "@assignment.inner",
        ["l="] = "@assignment.lhs",
        ["o="] = "@assignment.outer",
        ["r="] = "@assignment.rhs",
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer",
        ["ic"] = "@call.inner",
        ["ac"] = "@call.outer",
        ["is"] = "@class.inner",
        ["as"] = "@class.outer",
        ["iq"] = "@comment.inner",
        ["aq"] = "@comment.outer",
        ["ii"] = "@conditional.inner",
        ["ai"] = "@conditional.outer",
        ["if"] = "@function.inner",
        ["af"] = "@function.outer",
        ["il"] = "@loop.inner",
        ["al"] = "@loop.outer",
        ["in"] = "@number.inner",
        ["ia"] = "@parameter.inner",
        ["aa"] = "@parameter.outer",
        ["ip"] = "@regex.inner",
        ["ap"] = "@regex.outer",
        ["ir"] = "@return.inner",
        ["ar"] = "@return.outer",
        ["-"] = { query = "@local.scope", query_group = "locals" },
        ["z"] = { query = "@fold", query_group = "folds" },
        ["at"] = "@statement.outer",
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ["@assignment.inner"] = 'v',
        ["@assignment.lhs"] = 'v',
        ["@assignment.outer"] = 'V',
        ["@assignment.rhs"] = 'v',
        ["@block.inner"] = 'V',
        ["@block.outer"] = 'V',
        ["@call.inner"] = 'v',
        ["@call.outer"] = 'v',
        ["@class.inner"] = 'V',
        ["@class.outer"] = 'V',
        ["@comment.inner"] = 'v',
        ["@comment.outer"] = 'v',
        ["@conditional.inner"] = 'V',
        ["@conditional.outer"] = 'V',
        ["@function.inner"] = 'V',
        ["@function.outer"] = 'V',
        ["@loop.inner"] = 'V',
        ["@loop.outer"] = 'V',
        ["@number.inner"] = 'v',
        ["@parameter.inner"] = 'v',
        ["@parameter.outer"] = 'v',
        ["@regex.inner"] = 'v',
        ["@regex.outer"] = 'v',
        ["@return.inner"] = 'v',
        ["@return.outer"] = 'V',
        ["@local.scope"] = 'V',
        ["@fold"] = 'V',
        ["@statement.outer"] = 'V',
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true or false
      include_surrounding_whitespace = true,
    },
    swap = {
      enable = true,
      swap_next = {
        [">i="] = "@assignment.inner",
        [">l="] = "@assignment.lhs",
        [">="] = "@assignment.outer",
        [">r="] = "@assignment.rhs",
        [">ib"] = "@block.inner",
        [">b"] = "@block.outer",
        [">ic"] = "@call.inner",
        [">c"] = "@call.outer",
        [">is"] = "@class.inner",
        [">s"] = "@class.outer",
        [">iq"] = "@comment.inner",
        [">q"] = "@comment.outer",
        [">ii"] = "@conditional.inner",
        [">i"] = "@conditional.outer",
        [">if"] = "@function.inner",
        [">f"] = "@function.outer",
        [">il"] = "@loop.inner",
        [">l"] = "@loop.outer",
        [">in"] = "@number.inner",
        [">a"] = "@parameter.inner",
        [">aa"] = "@parameter.outer",
        [">ip"] = "@regex.inner",
        [">p"] = "@regex.outer",
        [">ir"] = "@return.inner",
        [">r"] = "@return.outer",
        [">-"] = { query = "@local.scope", query_group = "locals" },
        [">z"] = { query = "@fold", query_group = "folds" },
        [">t"] = "@statement.outer",
      },
      swap_previous = {
        ["<i="] = "@assignment.inner",
        ["<l="] = "@assignment.lhs",
        ["<="] = "@assignment.outer",
        ["<r="] = "@assignment.rhs",
        ["<ib"] = "@block.inner",
        ["<b"] = "@block.outer",
        ["<ic"] = "@call.inner",
        ["<c"] = "@call.outer",
        ["<is"] = "@class.inner",
        ["<s"] = "@class.outer",
        ["<iq"] = "@comment.inner",
        ["<q"] = "@comment.outer",
        ["<ii"] = "@conditional.inner",
        ["<i"] = "@conditional.outer",
        ["<if"] = "@function.inner",
        ["<f"] = "@function.outer",
        ["<il"] = "@loop.inner",
        ["<l"] = "@loop.outer",
        ["<in"] = "@number.inner",
        ["<a"] = "@parameter.inner",
        ["<aa"] = "@parameter.outer",
        ["<ip"] = "@regex.inner",
        ["<p"] = "@regex.outer",
        ["<ir"] = "@return.inner",
        ["<r"] = "@return.outer",
        ["<-"] = { query = "@local.scope", query_group = "locals" },
        ["<z"] = { query = "@fold", query_group = "folds" },
        ["<t"] = "@statement.outer",
      },
    },
  },
}

local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

require'treesitter-context'.setup{}
-- Make context background grey
vim.cmd("hi TreesitterContext guibg=Grey")

