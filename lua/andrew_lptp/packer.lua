-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- LSP Config
  use('neovim/nvim-lspconfig')

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
  use( {'nvim-treesitter/nvim-treesitter'
    }
  )
  -- Colorschemes
  use('sainnhe/everforest')

end)
