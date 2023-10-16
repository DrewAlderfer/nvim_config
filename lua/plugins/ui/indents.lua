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
    -- Active indent guide and indent text objects. When you're browsing
    -- code, this highlights the current level of indentation, and animates
    -- the highlighting.
    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        -- event = "LazyFile",
        opts = function() 
            -- If you want to activate the animation for context highlighting
            -- then uncomment the table definition below and pass:
            -- require("mini.indentscope").gen_animation.quadratic(...)
            -- to the animation setting under `draw`
            -- 
            -- local anim_opts = {
                -- "out", -- ease direction ["in", "out", "both"]
                -- 100,   -- duration in ms
                -- "total",-- duration time as per "step" or "total"
            -- }
            -- Options to return for mini.indentscope.setup()
            return {
            draw = {
                delay = 50,
                animation = require("mini.indentscope").gen_animation.none()
            },
            -- symbol = "▏",
            symbol = "│",
            options = { 
                indent_at_cursor = false,
                try_as_border = true 
                },
            }
        end,
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
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
                callback = function()
                vim.b.miniindentscope_disable = true
                end,
            })
        end,
    }
}
