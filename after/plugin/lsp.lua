-- LSP --
local lsp = require("lspconfig")

SetupMasonIfNotAlreadyDone()

vim.keymap.set("n", "<leader>lsp", "<cmd>LspInfo<CR>")

vim.diagnostic.config({
    virtual_text = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border="rounded"})
require('lspconfig.ui.windows').default_options.border = 'single'

-- Diagnostics Handling --

local disable_buffer_diagnostics_if_necessary = function(bufnr)
	if vim.b[bufnr].diagnostics_disabled or vim.g.diagnostics_disabled then
		vim.diagnostic.disable(bufnr)
	end
end

local toggle_diagnostics = function(global)
	local vars, bufnr, cmd
	if global then
		vars = vim.g
		bufnr = nil
	else
		vars = vim.b
		bufnr = 0
	end
	vars.diagnostics_disabled = not vars.diagnostics_disabled
	if vars.diagnostics_disabled then
        vim.api.nvim_echo({ { 'Disabling diagnostics…' } }, false, {})
		cmd = 'disable'
	else
        vim.api.nvim_echo({ { 'Enabling diagnostics…' } }, false, {})
		cmd = 'enable'
	end
	vim.schedule(function() vim.diagnostic[cmd](bufnr) end)
end

local toggle_buffer_disgnostics = function()
    toggle_diagnostics(false)
end

-- Keymaps --
local setup_lsp_keymaps = function(opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>fd", function() vim.diagnostic.open_float({border="single"}) end, opts)
  vim.keymap.set("n", "<leader>td", function() toggle_buffer_disgnostics() end, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set({'n', 'v'}, "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>ref", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  -- vim.keymap.set("i", "Find Appropriate Keymap", vim.lsp.buf.signature_help, opts)
end

-- Completion --
local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
        documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<F5>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 40, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
            }),
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            -- before = function (entry, vim_item)
            --  ...
            --    return vim_item
            -- end
        }),
    },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

local completion_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- General on_attach Stuff ---
local do_general_on_attach_stuff = function(client, bufnr)
    disable_buffer_diagnostics_if_necessary(bufnr)
    local opts = {buffer = bufnr, remap = false}
    setup_lsp_keymaps(opts)
    require('nvim-navic').attach(client, bufnr)
end

-- Rust Tools --
local rt = require("rust-tools")

local codelldb_path = GetCodelldbPath()
local liblldb_path = GetLiblldbPath()

rt.setup({
  tools = { autoSetHints = false,
    inlay_hints = { auto = false },
    hover_actions = { auto_focus = true }
  },
  server = {
    on_attach = function(client, bufnr)
      do_general_on_attach_stuff(client, bufnr)
      vim.keymap.set("n", "<leader>kk", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set({"n", "v"}, "<leader>aa", rt.code_action_group.code_action_group, { buffer = bufnr })
      vim.keymap.set("n", "<leader>rdb", rt.debuggables.debuggables)
      vim.keymap.set("n", "<leader>rr", rt.runnables.runnables)
      vim.keymap.set("n", "<leader>rsh", rt.inlay_hints.set)
      vim.keymap.set("n", "<leader>rhh", rt.inlay_hints.unset)
      vim.keymap.set("n", "<leader>rmu", "<cmd>RustMoveItemUp<CR>")
      vim.keymap.set("n", "<leader>rmd", "<cmd>RustMoveItemDown<CR>")
    end,
    capabilities = completion_capabilities,
    cmd = { "rustup", "run", "stable", "rust-analyzer" },
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
                extraArgs = { "--all", "--", "-W", "clippy::all" }
            }
        }
    },
  },
  dap = {
    adapter = require('rust-tools.dap').get_codelldb_adapter(
      codelldb_path, liblldb_path)
  },
})

-- Clangd --
lsp.clangd.setup{
    on_attach = function(client, bufnr)
        do_general_on_attach_stuff(client, bufnr)
        vim.keymap.set("n", "<leader>hh", "<cmd>ClangdSwitchSourceHeader<CR>", { buffer = bufnr })
    end,
}

-- Lua --
lsp.lua_ls.setup {
    on_attach = function(client, bufnr)
        do_general_on_attach_stuff(client, bufnr)
    end,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }  -- Fix "Undefined global 'vim'" LSP error.
            }
        }
    }
}

