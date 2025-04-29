local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	print("Installing packer close and reopen Neovim...")
end

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

packer.startup(function(use)
	-- tracking for package manager, packer
	use("wbthomason/packer.nvim")
	-- main colourscheme
	use("sainnhe/sonokai")
	-- obey editorconfig
	use("editorconfig/editorconfig-vim")

	-- issue highlighting and stuff goes here
	use("nvimtools/none-ls.nvim")
	use("nvimtools/none-ls-extras.nvim")

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
		},
	})

	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
	})

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})

	use("nvim-tree/nvim-web-devicons")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"vim-airline/vim-airline",
		"vim-airline/vim-airline-themes",
	})

	use("joshuavial/aider.nvim")

	-- general bootstrap stuff
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end

	require("nvim-tree").setup({
		view = {
			width = 50,
		},
	})

	require("mason").setup()

	require("aider").setup({
		auto_manage_context = false,
		default_bindings = false,
		debug = true,
		vim = true,
		ignore_buffers = {},
	})
	vim.api.nvim_set_keymap("n", "<leader>o", ":AiderOpen --no-gitignore<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<leader>m", ":AiderAddModifiedFiles<CR>", { noremap = true, silent = true })

	require("nvim-treesitter.configs").setup({
		ensure_installed = { "hcl" },
		highlight = { enable = true },
	})
end)

require("nvim-web-devicons").setup({
	-- your personal icons can go here (to override)
	-- you can specify color or cterm_color instead of specifying both of them
	-- DevIcon will be appended to `name`
	override = {
		zsh = {
			icon = "?",
			color = "#428850",
			cterm_color = "65",
			name = "Zsh",
		},
	},
	-- globally enable different highlight colors per icon (default to true)
	-- if set to false all icons will have the default icon's color
	color_icons = true,
	-- globally enable default icons (default to false)
	-- will get overriden by `get_icons` option
	default = true,
	-- globally enable "strict" selection of icons - icon will be looked up in
	-- different tables, first by filename, and if not found by extension; this
	-- prevents cases when file doesn't have any extension but still gets some icon
	-- because its name happened to match some extension (default to false)
	strict = true,
	-- set the light or dark variant manually, instead of relying on `background`
	-- (default to nil)
	variant = "light|dark",
	-- same as `override` but specifically for overrides by filename
	-- takes effect when `strict` is true
	override_by_filename = {
		[".gitignore"] = {
			icon = "?",
			color = "#f1502f",
			name = "Gitignore",
		},
	},
	-- same as `override` but specifically for overrides by extension
	-- takes effect when `strict` is true
	override_by_extension = {
		["log"] = {
			icon = "?",
			color = "#81e043",
			name = "Log",
		},
	},
	-- same as `override` but specifically for operating system
	-- takes effect when `strict` is true
	override_by_operating_system = {
		["apple"] = {
			icon = "?",
			color = "#A2AAAD",
			cterm_color = "248",
			name = "Apple",
		},
	},
})
