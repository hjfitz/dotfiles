local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
	'eslint',
	'tsserver',
	'graphql',
	'terraformls',
	'tflint',
	'bashls',
	'yamlls',
})

local function allow_format(servers)
	return function(client) return vim.tbl_contains(servers, client.name) end
end

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
	local opts = { buffer = bufnr }

	vim.keymap.set({ 'n', 'x' }, '<Leader>f', function()
		pcall(function()
			vim.api.nvim_command('EslintFixAll')
		end)
		vim.lsp.buf.format({
			async = false,
			timeout_ms = 10000,
			filter = allow_format({ 'lua_ls', 'rust_analyzer', 'gopls', 'xmlformatter', 'jdtls', 'jedi-language-server' })
		})
	end, opts)
end)

lsp.setup()
