local fn = vim.fn

-- Automatically install Packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing Packer: close and reopen Neovim..."
	vim.cmd[[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file

vim.cmd [[
	augroup packer_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
	]]

-- Use a protected call so we don't error out on the first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end


-- Have Packer use a popup
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install Plugins

return packer.startup(function(use)
	use { "wbthomason/packer.nvim" }
	use { "nvim-lua/plenary.nvim" }
	use { "windwp/nvim-autopairs" }
	use { "L3MON4D3/LuaSnip" }

	-- Show Colors behind hex codes
--	use { "norcalli/nvim-colorizer.lua",
--				config = function()
--					require("colorizer").setup()
--				end
--	}
	-- LSP Configuration
	use { "williamboman/nvim-lsp-installer",
				"neovim/nvim-lspconfig",
	}
	use { "onsails/lspkind.nvim" }

	-- Completion
	use { "hrsh7th/nvim-cmp" }
	use { "hrsh7th/cmp-buffer" }
	use { "hrsh7th/cmp-path" }
	use { "hrsh7th/cmp-nvim-lua" }
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/cmp-nvim-lsp-document-symbol" }
	use { "saadparwaiz1/cmp_luasnip" }
	use { "tamago324/cmp-zsh" }

	-- Comparators
	use { "lukas-reineke/cmp-under-comparator" }

	-- colorschemes
	use { "gruvbox-community/gruvbox" }
	use { "folke/tokyonight.nvim" }
	use { "arcticicestudio/nord-vim" }
	use { "sainnhe/everforest" }

	-- Treesitter
	use { "nvim-treesitter/nvim-treesitter" }

	-- Telescope
	use { "nvim-telescope/telescope.nvim" }
	use { "BurntSushi/ripgrep" }
	use { "sharkdp/fd" }

	-- Tree Explorer
	use { "kyazdani42/nvim-web-devicons" }
	use { "kyazdani42/nvim-tree.lua" }

	-- GitSigns
	use { "lewis6991/gitsigns.nvim",
				config = function()
					require('gitsigns').setup()
				end
	}

	-- Spellsitter
	use { "lewis6991/spellsitter.nvim",
				config = function()
					require("spellsitter").setup()
				end
		}


	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)


