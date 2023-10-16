return {
	{"n", "<leader>lr", vim.lsp.buf.document_highlight, { desc = "" }},
	{"n", "<leader>lc", vim.lsp.buf.clear_references, { desc = "" }},

	{"n", "gd", vim.lsp.buf.definition, { desc = "" }},
	{"n", "<leader>rn", vim.lsp.buf.rename, { desc = "" }},
	{"n", "<leader>mf", vim.lsp.buf.format, { desc = "" }},
	{"n", "<c-i>", vim.lsp.buf.hover, { desc = "" }},
	{"n", "<c-s>", vim.lsp.buf.signature_help, { desc = "" }},
    {"n", "<leader><leader>i", ":lua vim.diagnostic.open_float(nil, {focus=false, scope='line'})<CR>", { noremap=true, silent=true, buffer=bufnr, desc = "" }},
}
