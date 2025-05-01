local builtin = require("telescope.builtin")
vim.keymap.set("n", "ff", function()
	builtin.find_files({
		hidden = true,
		no_ignore = false,
		no_ignore_parent = false,
		file_ignore_patterns = { "^.git/" },
	})
end, { desc = "find files" })

vim.keymap.set("n", "fg", function()
	builtin.live_grep({
		additional_args = function(args)
			return vim.list_extend(args, { "--hidden", "--glob", "!.git/*" })
		end,
	})
end, { desc = "live grep" })

vim.api.nvim_set_keymap("n", "ss", ":vsplit<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "sf", ":split<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "tn", ":tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "tl", ":tabnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "th", ":tabprev<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>h", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>j", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>k", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>l", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>q", ":vertical resize +10<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>r", ":vertical resize -10<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>e", ":resize +10<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>w", ":resize -10<CR>", { noremap = true })

-- Enable copy and paste from clipboard
if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end
