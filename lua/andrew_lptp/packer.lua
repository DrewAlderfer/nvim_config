-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- LSP Config
  use('neovim/nvim-lspconfig')
  use({'glepnir/lspsaga.nvim',
        branch = "main",
        config = function()
            local saga = require("lspsaga")
            saga.init_lsp_saga({
                --config
            })
        end,
    })
  use({"jose-elias-alvarez/null-ls.nvim",
        config = function ()
                 require("null-ls").setup()
             end,
            requires = {"nvim-lua/plenary.nvim"},
    })
  use "stsewd/isort.nvim"
  use "averms/black-nvim"

  -- Comment.nvim
  use { 'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
  }
  use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup {}
        end
    }
  -- Cmp
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lua')
  use('onsails/lspkind.nvim')

  -- Luasnips
  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')
  -- Snippets
  use('rafamadriz/friendly-snippets')

  -- Telescope
  use( {
	  'nvim-telescope/telescope.nvim', branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'},
					{'BurntSushi/ripgrep' },
					{'sharkdp/fd'}
				}
        }
  )
  -- Treesitter
  use('nvim-treesitter/nvim-treesitter')
  use('nvim-treesitter/playground')

  -- Jupyter Ascending
  use 'untitled-ai/jupyter_ascending.vim' 
  -- install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  -- Lualine
  use('nvim-lualine/lualine.nvim')
  
  -- Colorschemes
  use('DrewAlderfer/gruvbox.nvim')
  use('sainnhe/everforest')
  use('folke/tokyonight.nvim')
  
  -- Colorizer
  use({'norcalli/nvim-colorizer.lua',
        config = function ()
            require('colorizer').setup()
        end
    })
end)
