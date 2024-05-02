vim.cmd('colorscheme PaperColor')
--vim.cmd('colorscheme atlas')
vim.cmd('hi Normal ctermbg=NONE')
vim.cmd('set nowrap')

vim.wo.rnu = true
vim.wo.nu = true
vim.wo.colorcolumn = '80'

--vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

vim.g.mapleader = ' '

vim.o.completeopt = "menu,menuone,noselect"
vim.o.cursorcolumn = true
vim.o.mouse = 'a'
vim.o.scrolloff = 4
vim.o.signcolumn = 'yes'
vim.o.clipboard = 'unnamed'

vim.g.markdown_fenced_languages = { "js=javascript", "yaml", "json", "python", "bash=sh", "viml=vim", "go", "rust",
	"toml", "lua", "html", "css", "typescript", "tsx=typescriptreact", "javascriptreact", "javascript.jsx", "typescriptreact",
	"typescript.tsx" }
