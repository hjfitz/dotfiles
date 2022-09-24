local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
	'eslint',
	'tsserver',
	'sumneko_lua',
	'graphql',
	'terraformls',
	'tflint',
	'bashls',
	'yamlls',
})

lsp.setup()
