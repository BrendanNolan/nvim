require('oil').setup{
  keymaps = {
    ['gh'] = 'actions.toggle_hidden',
    ["g?"] = "actions.show_help",
    -- Only specifying these because the defaults interfere with my own keymaps for pane switching
    ["<CR>"] = "actions.select",
    ["loils"] = "actions.select_vsplit",
    ["loilh"] = "actions.select_split",
    ["loilt"] = "actions.select_tab",
    ["loilp"] = "actions.preview",
    ["loilc"] = "actions.close",
    ["loill"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["loilcwd"] = "actions.open_cwd",
    ["loilcd"] = "actions.cd",
    ["loiltcd"] = "actions.tcd",
    ["gcs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g\\"] = "actions.toggle_trash",
  },
  skip_confirm_for_simple_edits = true,
  use_default_keymaps = false,
  view_options = { show_hidden = false },
}

vim.keymap.set('n', '-', require('oil').open, { desc = 'Open parent directory' })
