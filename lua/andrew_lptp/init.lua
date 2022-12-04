require("andrew_lptp.packer")
require("andrew_lptp.set")
require("andrew_lptp.jupyter_ascending")
require("andrew_lptp.lsp.null-ls")
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"sumneko_lua", "rust_analyzer", "pyright", "remark_ls", "clangd"},
    automatic_installation = true,
})
require("mason-lspconfig").setup_handlers({
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end,
    ['sumneko_lua'] = function ()
        lspconfig.sumneko_lua.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }
    end,
    ["rust_analyzer"] = function ()
        require("rust-tools").setup {
            rt.setup({
                  server = {
                      on_attach = function(_, bufnr)
                          -- Hover actions
                          vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                          --             -- Code action groups
                          vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                      end,
                  },
              })
        }
    end,
})
require('dap-python').setup('~/.venvs/debugpy/bin/python')
require("luasnip.loaders.from_vscode").lazy_load()

local nvim_py_path = "~/.venvs/nvim/bin/python3.10"
local learn_env_path = '~/conda/envs/tf_env/bin/'

vim.cmd("let g:python3_host_prog='~/conda/bin/python3.10'")
vim.api.nvim_set_hl(0, "@function.decorator", {fg = "#eabd4f", bg = "#35382c", bold= true})
vim.api.nvim_set_hl(0, "Operator", {italic = false})
vim.api.nvim_set_hl(0, "String", {fg = "#93a95d", italic=true})
