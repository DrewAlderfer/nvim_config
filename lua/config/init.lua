print("config.init")
local Util = require("util")

local M = {}

M.version = "0.1.0"

function M.options()
    require("config.options")
end

function M.keymaps()
    local map = require("config.keymaps")
    Util.mapkeys(map)
    print("Keymaps Loaded")
end

function M.extras()
    local extras = require("config.extras")
    return extras
end

function M.setup()
    M.options()
    M.keymaps()

    -- Setup Plugin Manager
    require("lazy").setup("plugins")

    -- Setup Colorscheme
    require("tokyonight").load()
end

return M
