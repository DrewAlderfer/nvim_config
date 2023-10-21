local Util = require("util")
local namespace = "plugins/lsp/servers"
-- local path = vim.fn.stdpath('config') .. '/lua/plugins/lsp/servers'
local M = {}

M.opts = Util.collect(namespace)
-- local function collect_files (empty_guy)
    -- for _, file in ipairs(vim.fn.readdir(path, [[v:val =~ '\.lua$']])) do
        -- table.insert(empty_guy, file)
    -- end
-- end

-- collect_files(M.opts)

function M.find(query)
    for _, name in pairs(M.opts) do
        if query .. ".lua" == name then
            return require(namespace .. query)
        end
    end
end

return M

