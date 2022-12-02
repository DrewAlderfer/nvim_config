local Remap = require("andrew_lptp.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>md", ":MarkdownPreviewToggle<CR>")
vim.cmd("lua vim.g.mkdp_theme = 'light'")
