local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local completion = null_ls.builtins.completion
local formatting = null_ls.builtins.formatting
-- local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		completion.luasnip,
		diagnostics.pylint,
		formatting.black,
		formatting.isort,
		formatting.stylua,
	}
})
