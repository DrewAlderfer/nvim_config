local Remap = require("andrew_lptp.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap
local inoremap = Remap.inoremap
local nmap = Remap.nmap

local bufopts = { noremap=true, silent=true, buffer=bufnr}
-- LSP Functions
nnoremap("<leader>rn", function() 
    vim.lsp.buf.rename()
end); -- symbol rename

nnoremap("<C-w>t", ":tabnew"..function() vim.fn.bufname end)
nnoremap("<leader>ee", ":vnew<CR>:Ex<CR>")-- Opens an Ex win
-- Telescope
nnoremap("<leader>ff", ":Telescope find_files<CR>")
nnoremap("<leader>tel", ":Telescope<CR>")
nnoremap("<leader>fb", ":Telescope buffers<CR>")

-- Insert new line below
nnoremap("<leader>o", "o<C-c>")
-- Insert new line above
nnoremap("<leader>O", "O<C-c>")
-- Open New Buffer
nnoremap("<leader>nt", ":new<CR>") -- Open Above
nnoremap("<leader>nl", ":vnew<CR>") -- Open Left
-- Navigate Buffers
nnoremap("<C-k>", ":bprev<CR>") -- Previous Buffer
nnoremap("<C-j>", ":bnext<CR>") -- Next Buffer
-- Movement
