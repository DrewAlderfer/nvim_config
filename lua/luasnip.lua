if vim.g.snippet ~= "luasnip" or not pcall(require, "luasnip") then
	return
end

local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {

	history = true,


	updateevents = "TextChanged, TextChanged1",

	enable_autosnippets = true,

	ext_opt = {
		[types.choiceNode] = {
			active = {
				virt_text = { { " <- Current Choice", "NonTest" } },
			},
		},
	},
}
	
vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jump() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/AppData/Local/nvim/lua/luasnip.lua<CR>")

