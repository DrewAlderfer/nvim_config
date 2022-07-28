vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.shortmess:append "c"

vim.api.nvim_set_keymap(
	"i",
	"<C-x><C-m>",
	[[<c-r>=luaeval("require('complextras').complete_matching_line()")<CR>]],
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"i",
	"<C-x><C-d>",
	[[<c-r>=luaeval("require('complextras').complete_line_from_cwd()")<CR>]],
	{ noremap = true }
)

local ok, lspkind = pcall(require, "lspkind")
if not ok then
	return
end

lspkind.init()

local cmp = require "cmp"

cmp.setup {

	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
		["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-a>"] = cmp.mapping.abort(),
		["<c-y>"] = cmp.mapping(
			cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			},
			{ "i", "c" }
		),

		["<c-space>"] = cmp.mapping {
			i = cmp.mapping.complete(),
			c = function(
				_
			)
				if cmp.visible() then
					if not cmp.confirm { select = true } then
						return
					end
				else
					cmp.complete()
				end
			end,
		},

		["<tab>"] = cmp.config.disable,

		["<C-q>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
	},

	sources = {
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 5 },
	},

	sorting = {

		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,

			function(entry1, entry2)
				local _, entry1_under = entry1.completion_item.label:find "^_+"
				local _, entry2_under = entry2.completion_item.label:find "^_+"
				entry1_under = entry1_under or 0
				entry2_under = entry2_under or 0
				if entry1_under > entry2_under then
					return false
				elseif entry1_under < entry2_under then
					return true
				end
			end,

			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},


	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- for 'luasnip' users
		end,
	},

	formatting = {

		format = lspkind.cmp_format {
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[PATH]",
				luasnip = "[snippet]",
				gh_issues = "[issues]",
				tn = "[TabNine]",
			},
		},
	},

	expertimental = {
		native_menu = false,

		ghost_text = true,
	},


}
