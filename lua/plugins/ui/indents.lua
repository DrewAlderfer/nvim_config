return {
    {
        "lukas-reineke/indent-blankline.nvim",
        -- event = "LazyFile",
        config = function()

            local hooks = require("ibl.hooks")
            local names = {
                "level_one",
                "level_two",
                "level_three",
                "level_four",
                "level_five",
            }

            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                local highlight = {
                level_one = "#403173",
                level_two = "#47348a",
                level_three = "#453f91",
                level_four = "#494b8b",
                level_five = "#545693",
                }
                for name, color in pairs(highlight) do
                    vim.api.nvim_set_hl(0, name, { fg = color })
                end
            end)

            require("ibl").setup {
                indent = {
                    highlight = names,
                    char = "│",
                    tab_char = "│",
                },
                scope = { enabled = false },
                exclude = {
                    filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                    },
                },
            }
        end,
    },
}
