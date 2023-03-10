local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- automatically install plugins when this file is modified
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer (protected call)
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- install plugins
return packer.startup(function(use)
	use("wbthomason/packer.nvim")
  
  -- color schemes 
  use "EdenEast/nightfox.nvim"

  -- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- tmux and split window navigation
	use("christoomey/vim-tmux-navigator")

	-- essential plugins
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")

	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- icons
	use("kyazdani42/nvim-web-devicons")

	-- status line
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- managing and installing lsp server, linters and formatters
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- configure lsp servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("onsails/lspkind.nvim")

	-- formatting and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- treesitter
  use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

  -- metals for scala 
  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})

   -- oil 
  use ({'stevearc/oil.nvim'})
  
  -- nvim netrw icons and stuff 
  use ({'prichrd/netrw.nvim'})

  -- UNIX like commands for vim  
  use ({'tpope/vim-eunuch'})

  -- function signature LSP 
  use ({"ray-x/lsp_signature.nvim"})

  -- colorized brackets 
  use ({"p00f/nvim-ts-rainbow"})

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  -- git plugin
  use ({"tpope/vim-fugitive"})

  -- syntax highlighting for nomad
  use ({"jvirtanen/vim-hcl"})

  -- telescope ui select 
  use ({"nvim-telescope/telescope-ui-select.nvim"})

  -- vim float terminal 
  use ({"voldikss/vim-floaterm"})

  -- trouble nvim for diagnostics and stuff
  use ({"folke/trouble.nvim"})

  use ({"ggandor/leap.nvim"})

  require'netrw'.setup{}
	if packer_bootstrap then
		require("packer").sync()
	end
end)
