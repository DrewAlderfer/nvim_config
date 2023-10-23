print("Options Settings")
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
vim.g.mapleader = " "

local opt = vim.opt

opt.clipboard = "unnamedplus"
-- opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3

opt.cursorline = true
opt.colorcolumn = "80"
opt.expandtab = true
opt.grepprg = "rg --vimgrep"
opt.guicursor = "a:block,i:blinkwait200-blinkoff175-blinkon100"
opt.hlsearch = false
opt.inccommand = "nosplit"
opt.incsearch = true
opt.mouse = ""
opt.laststatus = 3
opt.list = true
opt.number = true
opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 10
opt.shiftround = true
opt.shiftwidth = 4
opt.shortmess:append({ W = true, I = true, c = true, C = true})
opt.sidescrolloff = 16
opt.signcolumn = "yes"
opt.smartindent = true
opt.spelllang = { "en" }
opt.splitbelow = true
opt.tabstop = 4
opt.termguicolors = true
opt.timeoutlen = 1000
opt.undofile = false
opt.swapfile = false
opt.updatetime = 200
opt.virtualedit = "block"
opt.wildmode = "longest:full,full"
opt.winminwidth = 5
opt.wrap = false
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end

-- Folding
vim.opt.foldlevel = 99
-- vim.opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.statuscolumn = [[%!v:lua.require'lazyvim.util'.ui.statuscolumn()]]
end

-- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
-- if vim.fn.has("nvim-0.10") == 1 then
--   vim.opt.foldmethod = "expr"
--   vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- else
--   vim.opt.foldmethod = "indent"
-- end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
