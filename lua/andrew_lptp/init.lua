require("andrew_lptp.packer")
require("andrew_lptp.set")
require("andrew_lptp.jupyter_ascending")
require("andrew_lptp.lsp.null-ls")

require("luasnip.loaders.from_vscode").lazy_load()
local nvim_py_path = "C:/Users/Drew\\ Alderfer/.venv/nvim/Scripts/python.exe"
local learn_env_path = 'C:/tools/anaconda/env/learn-env/python.exe'
vim.cmd(string.format("let g:python3_host_prog={}", nvim_py_path))
vim.api.nvim_set_hl(0, "@function.decorator", {fg = "#eabd4f", bg = "#35382c", bold= true})
vim.api.nvim_set_hl(0, "Operator", {italic = false})
vim.api.nvim_set_hl(0, "String", {fg = "#93a95d", italic=true})
