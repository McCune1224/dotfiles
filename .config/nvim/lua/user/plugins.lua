local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
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
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "kyazdani42/nvim-web-devicons" }) -- Nice Icons for bars n such
	use({ "kyazdani42/nvim-tree.lua" }) -- Side bar file explorer
	use({ "akinsho/bufferline.nvim", tag = "v3.*" }) -- Bar at top to show current buffers
	use({ "moll/vim-bbye" }) -- Better buffer deletion
	use({ "rcarriga/nvim-notify" }) -- Notifications in the top right

	use({ "nvim-lualine/lualine.nvim" }) -- Status Line
	use({ "arkav/lualine-lsp-progress" }) -- LSP Progress in status line
	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	}) -- LSP status line for code context

	use({ "akinsho/toggleterm.nvim" }) -- Allows to open a terminal in a buffer
	use({ "ahmedkhalf/project.nvim" }) -- Mark Projects in directory structures
	use({ "lewis6991/impatient.nvim" }) -- Quick Loading of Plugins
	use({ "lukas-reineke/indent-blankline.nvim" }) --Blankline indenting
	use({ "goolord/alpha-nvim" }) --Main Menu if just opening nvim by itself

	-- Colorschemes
	use({ "lunarvim/darkplus.nvim" })
	use({ "cocopon/iceberg.vim" })
	use({ "catppuccin/nvim", as = "catppuccin" }) -- BEST THEME WEEEW
	use({ "ellisonleao/gruvbox.nvim" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" }) -- LSP generated completion
	use({ "hrsh7th/cmp-nvim-lua" }) -- Lua generated completion

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/mason.nvim" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim" }) -- Helper plugin for lspconfig + mason(installer)
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "jayp0521/mason-null-ls.nvim" })
	use({ "RRethy/vim-illuminate" }) -- highlighting other uses of the word under the cursor

	--Github Copilot
	use({ "github/copilot.vim" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })
	-- WhichKey
	use({ "folke/which-key.nvim" })

	--Dressing
	use({ "stevearc/dressing.nvim" })

	use({ "MunifTanjim/nui.nvim" }) -- Required for noice
	use({ "folke/noice.nvim" }) -- Better UI components (popup menu, commands, etc)

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "nvim-treesitter/nvim-treesitter-context" })

	-- Git
	use({ "lewis6991/gitsigns.nvim" }) --

	--[[ -- DAP ]]
	--[[ use { "mfussenegger/nvim-dap" } -- DAP engine ]]
	--[[ use { "rcarriga/nvim-dap-ui" } -- UI for when running DAP ]]
	--TPOPE QOL
	use({ "tpope/vim-unimpaired" }) --Simply short normal mode aliases for commonly used ex commands
	use({ "tpope/vim-surround" }) -- Change text object surroundings
	use({ "tpope/vim-repeat" }) -- Better repeat functionality
	use({ "tpope/vim-fugitive" }) -- Git commands in nvim

	use({ "andweeb/presence.nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
