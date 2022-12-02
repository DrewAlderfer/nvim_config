local popup = require "plenary.popup"

local Remap = require("andrew_lptp.keymap")
local nnoremap = Remap.nnoremap

local bufopts = { noremap=true, silent=true, buffer=bufnr}
local run_py = require("andrew_lptp.py_utils").runpy

nnoremap("<leader><leader>e",run_py)



-- local function popup_a_win()
--     popup.create({'Test1', 'test2', 'test3'}, {
--         minwidth = 30,
--         minheight = 30,
--         border = true,
--     })
-- end

