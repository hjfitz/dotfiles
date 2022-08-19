local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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
				return require('packer.util').float({ border = 'single' })
			end
		}
	}
)

return packer.startup(function(use)
	use 'wbthomason/packer.nvim' 
	use "nvim-lua/popup.nvim" 
	use "nvim-lua/plenary.nvim" 
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
	use "jose-elias-alvarez/null-ls.nvim"
	use "jose-elias-alvarez/nvim-lsp-ts-utils"
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'ibhagwan/fzf-lua'
	use 'NLKNguyen/papercolor-theme'
	use 'L3MON4D3/LuaSnip'
	use 'simrat39/rust-tools.nvim'
	use 'TimUntersberger/neogit'
	use 'jxnblk/vim-mdx-js'
	use 'jparise/vim-graphql'
	use 'mfussenegger/nvim-dap'
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', 
		}
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end

	require("nvim-tree").setup()
	require("mason").setup()

end)



