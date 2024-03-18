local Util = require("my_util")

local M = {}

M.version = "0.1.0"

function M.options()
    require("config.options")
end

function M.keymaps()
    local map = require("config.keymaps")
    Util.mapkeys(map)
end

function M.extras()
    local extras = require("config.extras")
    return extras
end

function M.set_hlgroups()
    local hl_settings = require("config.hl_groups")
    return hl_settings
end

function M.setup()
    M.options()

    require("auc")

    -- Setup Plugin Manager
    require("lazy").setup("plugins")

    -- Setup Colorscheme
    require("catppuccin").load("mocha")
    M.keymaps()

    local hl_settings = M.set_hlgroups()
    for _, setting in pairs(hl_settings) do
        local name = setting[1]
        local val = setting[2]
        vim.api.nvim_set_hl(0, name, val)
    end

    vim.cmd("let python3_host_prog = '~/.cache/venv/nvim/bin/python3.11'")
end

return M
