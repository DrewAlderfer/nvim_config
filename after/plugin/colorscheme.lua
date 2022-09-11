vim.g.everforest_transparent_background = 2 

vim.cmd("colorscheme everforest")
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.api.nvim_set_hl(0, 'CursorLineNr',{fg="#e69875"})
