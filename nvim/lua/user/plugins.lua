local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'single' })
			end
		}
	}
)

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use 'wbthomason/packer.nvim' -- Have packer manage itself
	use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
	use "neovim/nvim-lspconfig"
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
	use 'jparise/vim-graphql'
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = {
		    'kyazdani42/nvim-web-devicons', -- optional, for file icons
	    },
	    tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

	

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end

	require("nvim-tree").setup()

end)


