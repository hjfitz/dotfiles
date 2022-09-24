require('plugins')
require('config')
require('maps')
require('lsp_zero')
local neogit = require('neogit')

neogit.setup {
	integrations = {
		diffview = true
	}
}


