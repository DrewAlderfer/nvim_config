local Remap = require("andrew_lptp.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap
local inoremap = Remap.inoremap
local nmap = Remap.nmap

local bufopts = { noremap=true, silent=true, buffer=bufnr}

nnoremap("<leader>ee", ":vnew<CR>:luado vim.api.nvim_win_set_width(0, 30)<CR>:Ex<CR>")-- Opens an Ex win
nnoremap("<c-c>", "<NOP>")
nnoremap("<Up>", "<NOP>")
nnoremap("<Down>", "<NOP>")
nnoremap("<Left>", "<NOP>")
nnoremap("<Right>", "<NOP>")


-- Telescope
nnoremap("<leader>ff", ":Telescope find_files<CR>")
nnoremap("<leader>tel", ":Telescope<CR>")
nnoremap("<leader>fb", ":Telescope buffers<CR>")
nnoremap("<leader><leader>h", ":Telescope help_tags<CR>")

-- Insert new line below
nnoremap("<leader>o", "o<C-c>xxk")

-- Insert new line above
nnoremap("<leader>O", "O<C-c>xxj")

-- Open New Buffer
nnoremap("<leader>nt", ":new<CR>") -- Open Above
nnoremap("<leader>nl", ":vnew<CR>") -- Open Left

-- Navigate Buffers
nnoremap("<C-k>", ":bprev<CR>zz") -- Previous Buffer
nnoremap("<C-j>", ":bnext<CR>zz") -- Next Buffer

-- Movement
nnoremap("<c-e>", "3<c-e>")
nnoremap("<c-y>", "3<c-y>")
nnoremap("<c-d>", "<c-d>zz")
nnoremap("<c-u>", "<c-u>zz")
nnoremap("G", "Gzz")

-- No Remaps
nnoremap("<C-z>", "<NOP>")
