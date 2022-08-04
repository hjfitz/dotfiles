require("user.plugins")
require("user.ts-config")
require("user.rust-config")
local neogit = require('neogit')

vim.wo.rnu = true
vim.wo.nu = true
vim.wo.colorcolumn = '80'
--vim.o.nowrap = true
vim.cmd('colorscheme PaperColor')
vim.cmd('hi Normal ctermbg=NONE')
vim.o.mouse = 'a'
vim.o.scrolloff = 4
vim.o.signcolumn = 'yes'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.cursorline = true
vim.g.mapleader = ' '


vim.o.completeopt = "menu,menuone,noselect"
vim.o.cursorcolumn = true


--[[
vim.api.nvim_set_keymap('n', 'ff',
	"<cmd>lua require('fzf-lua').files()<CR>",
	{ noremap = true, silent = true }
)
--]]

vim.api.nvim_set_keymap('n', 'ff', '<cmd>Telescope find_files<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', 'fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', 'ss', ':vsplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'sf', ':split<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tn', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tl', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'th', ':tabprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>h', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>j', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>k', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>l', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gs', ':Neogit<CR>', { noremap = true })



--
-- Setup nvim-cmp.
local cmp = require'cmp'
local luasnip = require'luasnip'

cmp.setup({
	snippet = {
		expand = function(args)
			--vim.fn["vsnip#anonymous"](args.body)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		--completion = cmp.config.window.bordered(),
		--documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		['<C-n>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end

		end,
		['<C-p>'] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, 
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
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

neogit.setup {
	integrations = {
		diffview = true
	}
}

require'lspconfig'.graphql.setup{}

