if vim.g.snippets ~= "luasnip" or not pcall(require, "luasnip") then
local fmt          = require("fmt")
    return
end

local ls = require "luasnip"
local types = require "luasnip.util.types"

print("Hello, From Luasnip")

ls.config.set_config {
    -- This tells LuaSnip to remember to keep around the last snippet.
    -- You can jump back into it even if you move outside of the selection.
    history = true,

    -- This will cause dynamic snippets to update as you type
    updateevents = "TextChanged,TextChangedI",

    -- Autosnippets:
    enable_autosnippets = true,

    ext_opts = {
        [types.insertNode] = {
            active = {
                virt_text = { { "●", "GruvboxRed"} },
            }
        },
        [types.choiceNode] = {
            active = {
                virt_text = { { " ●", "GruvboxBlue" } },
            },
        },
    },
}

-- <C-k> expands the snippet
-- this will expand the current item or jump to the next item within the snippet
vim.keymap.set({"i", "s"}, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, {silent = true })

-- <c-j> jump backward
-- this always moves to the previous item within the snippet
vim.keymap.set({"i", "s" }, "<c-j>", function()
    if ls.choice_active(-1) then
        ls.change_choice(-1)
    end
end, { silent = true })

-- <c-l> selecting within a list of options.
--  This is useful for choice nodes
vim.keymap.set("i", "<c-m>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")
-- Shortcut to re-source this snippet file
vim.keymap.set("n", "<leader><leader>s", "<cmd>source C:/Users/Drew Alderfer/AppData/Local/nvim/after/plugin/luasnip.lua<CR>")

local snippet = ls.s

local t = ls.text_node

local c = ls.choice_node

local i = ls.insert_node

local f = ls.function_node

local d = ls.dynamic_node

local l = require("luasnip.extras").lambda

local events = require "luasnip.util.events"
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("all", {

    snippet("simple", t "-- wow, you were right!"),

    snippet("toexpand", c(1, { t "hello", t "world", t "last" }), {
        callbacks = {
            [1] = {
                [events.enter] = function(--[[ node ]])
                    toexpand_count = toexpand_count + 1
                    print("Number of times entered:", toexpand_count)
                end,
            },
        },
    }),
})

ls.add_snippets(
    "python",{
    snippet("traintest", fmt(
    [[
    y = {1}['{2}']
    X = {3}.drop(['{4}'], axis=1)

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size={5})
    ]],
    {
        i(1, "df"),
        i(2, ""),
        rep(1),
        rep(2),
        i(5, ".25")
    }
    )),
    snippet("opand", fmt(
    [[
    {1} = pd.{2}({3})

    {4}.info()
    ]],
    {
    i(1, "df"),
    i(2, "read_csv"),
    i(3, "file_name"),
    rep(1)
    }
    )),
    snippet("col_vc", fmt(
    [[
    col_names = {1}.columns
    for col in col_names:
        {2}[col].value_counts
    ]],
    {
        i(1, "df"),
        rep(1)
    }
    ))
}
)


