if vim.g.snippets ~= "luasnip" or not pcall(require, "luasnip") then
    return
end

local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
    -- This tells LuaSnip to remember to keep around the last snippet.
    -- You can jump back into it even if you move outside of the selection.
    history = true,

    -- This will cause dynamic snippets to update as you type
    updateevents = "TextChanged,TextChangedI",

    -- Autosnippets:
    enable_autosnippets = true,

    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { " « ", "Error" } },
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
