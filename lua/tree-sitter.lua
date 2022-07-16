local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = { "c", "python", "rust", "lua", "javascript", "markdown", "cpp" },
	highlight = {
		enable = true
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true },
})