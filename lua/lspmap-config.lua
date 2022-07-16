-- Mappings
-- definitions for mapping functions
local opts = { noremap=true, silent=true }
local keymap = vim.keymap.set
local gnostic = vim.diagnostic
local bopts = { noremap=true, silent=true, buffer=bufnr }
local buff = 'vim.lsp.buf'

-- See ':help vim.diagnostic.*' for documentation on any of the below functions
keymap('n', '<leader>i', gnostic.open_float, opts)
keymap('n', '[d', gnostic.goto_prev, opts)
keymap('n', ']d', gnostic.goto_next, opts)
keymap('n', '<leader>q', gnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Anable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.imnifunc')

	-- Mappings when and Lsp is attached
	-- see ':help vim.lsp.*' for documentation on any of the below functions
	keymap('n', 'gD', buff.declaration, bopts)
	keymap('n', 'gd', buff.definition, bopts)
	keymap('n', 'K', buff.hover, bopts)
	keymap('n', 'gi', buff.implementation, bopts)
	keymap('n', '<C-k>', buff.signature_help, bopts)
	keymap('n', '<leader>wa', buff.add_workspace_folder, bopts)
	keymap('n', '<leader>wr', buff.remove_workspace_folder, bopts)
	keymap('n', '<leader>wl', function()
		print(vim.inspect(buff.list_workspace_folders()))
	end, bopts)
	keymap('n', '<leader>D', buff.type_definition, bopts)
	keymap('n', '<leader>rn', buff.rename, bopts)
	keymap('n', '<leader>ca', buff.code_action, bopts)
	keymap('n', 'gr', buff.references, bopts)
	keymap('n', '<leader>mf', buff.formatting, bopts)
end

-- Lsp server managment
require("nvim-lsp-installer").setup {
	automatic_installation = true,
	ui = {
		icons = {
			sever_installed = "",
			server_pending = "",
			server_uninstalled = "",
		}
	}
}

require("lspconfig").sumneko_lua.setup {}
