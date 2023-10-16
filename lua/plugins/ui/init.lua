local Util = RELOAD("util")
local namespace = "plugins/ui"

local M = {}
Util.collect(M, namespace)
-- for _, file in pairs(vim.fn.readdir(path)) do
    -- if file ~= "init.lua" then
        -- local target = require((namespace:gsub("/", ".") .. "." .. file:gsub("%.lua$", '')))
        -- for _, value in pairs(target) do
            -- table.insert(M, value)
        -- end
    -- end
-- end
return M
