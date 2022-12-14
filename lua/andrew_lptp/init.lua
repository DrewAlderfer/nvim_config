require("andrew_lptp.packer")
require("andrew_lptp.set")
require("andrew_lptp.jupyter_ascending")
require("andrew_lptp.lsp.null-ls")
require("andrew_lptp.lsp.handlers")
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
    }
   }
})
require("mason-lspconfig").setup({
    ensure_installed = {"sumneko_lua", "rust_analyzer", "pyright", "remark_ls", "clangd"},
    automatic_installation = true,
})
require("mason-lspconfig").setup_handlers({
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end,
    -- ['sumneko_lua'] = function ()
    --     lspconfig.sumneko_lua.setup {
    --         settings = {
    --             Lua = {
    --                 diagnostics = {
    --                     globals = { "vim" }
    --                 }
    --             }
    --         }
    --     }
    -- end,
    -- ["rust_analyzer"] = function ()
    --     require("rust-tools").setup () 
    -- end,
})
require('dap-python').setup('~/conda/envs/debugpy/bin/python')
require("luasnip.loaders.from_vscode").lazy_load()

vim.cmd("let g:python3_host_prog='~/conda/envs/neovim/bin/python3.10'")
