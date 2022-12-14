-- vim.g.everforest_transparent_background = 2 
require('gruvbox').setup({
    contrast = "soft",
})
vim.cmd("colorscheme gruvbox")
-- vim.o.background = "dark"
vim.api.nvim_set_hl(0, "Normal", {fg = nil,bg = nil})
vim.g.gruvbox_transparent_bg = 1
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
-- vim.api.nvim_set_hl(0, 'CursorLineNr',{fg="#e69875"})

require('lualine').setup()

vim.api.nvim_set_hl(0, "@function.decorator", {fg="#eabd4f", bg="#35382c", bold=true})
vim.api.nvim_set_hl(0, "@variable", {link="Normal" })
vim.api.nvim_set_hl(0, "Operator", {link="Delimiter"})
vim.api.nvim_set_hl(0, "String", {fg="#a0c77d", italic=true})
vim.api.nvim_set_hl(0, "GruvboxGreenBold", {fg = "#d0df46", bg='#35382c', bold=true})
