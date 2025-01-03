local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
		install_path })
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


-- todo: find a better place for this
vim.cmd('let g:airline#extensions#tabline#enabled = 1')
vim.cmd("let g:airline_theme='bubblegum'")
vim.cmd('let g:airline_powerline_fonts = 1')

packer.init({
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'single' })
		end
	}
})

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'huyvohcmc/atlas.vim'

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'L3MON4D3/LuaSnip' },

			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },
		}
	}

	use "sainnhe/sonokai"
	use "nvim-lua/popup.nvim"
	use "nvim-lua/plenary.nvim"
	use 'mfussenegger/nvim-lint'
	use 'mhartington/formatter.nvim'
	use "jose-elias-alvarez/nvim-lsp-ts-utils"
	use 'hrsh7th/cmp-cmdline'
	use 'ibhagwan/fzf-lua'
	use 'NLKNguyen/papercolor-theme'
	use 'simrat39/rust-tools.nvim'
	use 'TimUntersberger/neogit'
	use 'jxnblk/vim-mdx-js'
	use 'jparise/vim-graphql'
	use 'mfussenegger/nvim-dap'
	use 'yorinasub17/vim-terragrunt'
	use 'hashivim/vim-terraform'
	use 'juliosueiras/vim-terraform-completion'
	use 'evanleck/vim-svelte'
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
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

	use {
		'vim-airline/vim-airline',
		'vim-airline/vim-airline-themes'
	}
	use "onsails/lspkind-nvim" -- vscode-like pictogramsplugins
	use "editorconfig/editorconfig-vim"
	--use "github/copilot.vim"
	use "prisma/vim-prisma"
	use 'leafgarland/typescript-vim'
	use 'peitalin/vim-jsx-typescript'

	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end

	require("nvim-tree").setup({
		view = {
			width = 50
		}
	})
	require("mason").setup()
end)

-- The below is required for enabling the tree-sitter syntax engine, which is used by pkl-neovim.
-- Set up Treesitter languages.
require 'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,     -- false will disable the whole extension
	},
	indent = {
		enable = true
	},
	additional_vim_regex_highlighting = false,
}
