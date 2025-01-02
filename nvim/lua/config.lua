vim.cmd.colorscheme("sonokai")
vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE" })
vim.opt.wrap = false

vim.g.airline_extensions_tabline_enabled = 1
vim.g.airline_theme = "bubblegum"
vim.g.airline_powerline_fonts = 1

vim.wo.rnu = true
vim.wo.nu = true
vim.wo.colorcolumn = "80"

vim.opt.shiftwidth = 4
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

vim.g.mapleader = " "

vim.o.completeopt = "menu,menuone,noselect"
vim.o.cursorcolumn = true
vim.o.mouse = "a"
vim.o.scrolloff = 4
vim.o.signcolumn = "yes"
vim.o.clipboard = "unnamed"

vim.g.markdown_fenced_languages = {
	"js=javascript",
	"yaml",
	"json",
	"python",
	"bash=sh",
	"viml=vim",
	"go",
	"rust",
	"toml",
	"lua",
	"html",
	"css",
	"typescript",
	"tsx=typescriptreact",
	"javascriptreact",
	"javascript.jsx",
	"typescriptreact",
	"typescript.tsx",
}
