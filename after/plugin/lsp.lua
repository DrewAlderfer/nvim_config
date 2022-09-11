local sumneko_root_path = "C:/Users/Drew Alderfer/.local/bin/sumneko_lua_server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

require'lspconfig'.pyright.setup{}
require'lspconfig'.sumneko_lua.setup{
    cmd = { sumneko_binary },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",

                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                -- Get the language server to recognize the 'vim' global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of the Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
  }
require'lspconfig'.marksman.setup{

    cmd = { marksman_binary },
}
