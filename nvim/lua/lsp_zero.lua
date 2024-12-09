local lsp = require('lsp-zero')

require('mason-lspconfig').setup({
  ensure_installed = {
    'eslint',
    'graphql',
    'terraformls',
    'tflint',
    'bashls',
    'yamlls',
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
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
			filter = allow_format({ 'lua_ls', 'rust_analyzer', 'gopls', 'xmlformatter', 'jdtls', 'jedi-language-server', 'csharp-language-server', 'prettier' })
		})
	end, opts)
end)

lsp.setup()
