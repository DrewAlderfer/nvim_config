local signs = { Error = "", 
                Warn = "喝",  
                Hint = "",
                Info = ">"
            }
vim.lsp.handlers["textDocument/publishDiagnostics"] =
vim.lsp.with(vim.lsp.handlers["textDocument/publishDiagnostics"], {
    underline = false,
    update_in_insert = false,
    virtual_text = false,
    severity_sort = true
})

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    severity_sort = true,
})

