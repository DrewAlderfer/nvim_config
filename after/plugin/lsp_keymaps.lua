local lsp_status_ok, _ = pcall(require, "lspconfig") 
if not lsp_status_ok then
    return
end

local util = vim.lsp.util
local Remap = require("andrew_lptp.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap
local inoremap = Remap.inoremap
local nmap = Remap.nmap

local bufopts = { noremap=true, silent=true, buffer=bufnr}

nnoremap("<leader>lr", vim.lsp.buf.document_highlight)
nnoremap("<leader>lc", vim.lsp.buf.clear_references)

nnoremap("gd", vim.lsp.buf.definition)
nnoremap("<leader>rn", vim.lsp.buf.rename)
nnoremap("<leader>mf", vim.lsp.buf.format)
nnoremap("<c-i>", vim.lsp.buf.hover)
nnoremap("<c-s>", vim.lsp.buf.signature_help)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        relative ='cursor',
        anchor = 'SW',
        width = 100,
        height = 20,
    }
)
