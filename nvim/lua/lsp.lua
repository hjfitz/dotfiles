local lsp = require("lsp-zero")
local util = require("lspconfig.util")
local null_ls = require("null-ls")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

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
			condition = function(utils)
				return utils.root_has_file({
					".eslintrc",
					".eslintrc.js",
					".eslintrc.cjs",
					".eslintrc.json",
					".eslintrc.yaml",
					".eslintrc.yml",
				})
			end,
		}),
	},
})

local function on_lsp_zero_attach(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })

	vim.keymap.set({ "n", "x" }, "<Leader>f", function()
		vim.lsp.buf.format({
			async = false,
			timeout_ms = 10000,
		})
	end, { buffer = bufnr })
end

lsp.on_attach(on_lsp_zero_attach)
lsp.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"gopls",
		"eslint",
		"ts_ls",
		"lua_ls",
		"pyright",
		"biome",
		"terraformls",
	},
})

lspconfig.biome.setup({
	root_dir = util.root_pattern("biome.json", "biome.toml", ".biomerc", "biome.jsonc"),
})

lspconfig.ts_ls.setup({})
lspconfig.eslint.setup({
	root_dir = util.root_pattern(
		".eslintrc",
		".eslintrc.js",
		".eslintrc.cjs",
		".eslintrc.json",
		".eslintrc.yaml",
		".eslintrc.yml"
	),
})
lspconfig.lua_ls.setup({})
lspconfig.pyright.setup({})
lspconfig.gopls.setup({})
lspconfig.yamlls.setup({})
lspconfig.jsonls.setup({})
lspconfig.bashls.setup({})
lspconfig.terraformls.setup({
	filetypes = { "terraform", "hcl", "tf", "tfvars" },
})

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 4,
	},
	signs = true,
	underline = true,
	update_in_insert = false,
})
