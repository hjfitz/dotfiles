require('plugins')
require('config')
require('maps')
require('lsp_zero')
require('cmp-config')
local neogit = require('neogit')

neogit.setup {
	integrations = {
		diffview = true
	}
}


