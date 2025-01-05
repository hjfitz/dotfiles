local lsp = require("lsp-zero")
local null_ls = require("null-ls")
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier.with({
			filetypes = {
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"json",
				"yaml",
			},
		}),
		require("none-ls.diagnostics.eslint").with({
			filetypes = {
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"vue",
			},
		}),
	},
})

local function on_lsp_zero_attach(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })

	vim.keymap.set({ "n", "x" }, "<Leader>f", function()
		vim.lsp.buf.format({
			async = false,
			timeout_ms = 10000,
			filter = function(client)
				return client.name == "null-ls"
			end,
		})
	end, { buffer = bufnr })
end

lsp.on_attach(on_lsp_zero_attach)
lsp.setup()


mason_lspconfig.setup({
    ensure_installed = {
        'eslint',
        'ts_ls',
        'lua_ls',
        'pyright',
    },
})

lspconfig.ts_ls.setup({})
lspconfig.eslint.setup({})
lspconfig.lua_ls.setup({})
lspconfig.pyright.setup({})