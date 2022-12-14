local jp_ascd =  vim.api.nvim_create_augroup("JupyterAscending", {clear = true})
local Remap = require("andrew_lptp.keymap")
local nnoremap = Remap.nnoremap

vim.api.nvim_create_autocmd("BufWritePost", {
    group = jp_ascd,
    pattern = "*.sync.py",
    command = "silent !python -m jupyter_ascending.requests.sync --filename <afile>:t"
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    group = jp_ascd,
    pattern = "*.sync.py",
    callback = function()
        nnoremap("<c-x>", function ()
            local cmd_str = "silent ! python -m jupyter_ascending.requests.execute "
            local cmd_file = "--filename " .. vim.fn.bufname()
            local cmd_line = " --line " .. vim.fn.getcurpos()[2]
            local exec_cmd = cmd_str .. cmd_file .. cmd_line
            vim.api.nvim_command(exec_cmd)
        end)
        nnoremap("<leader><leader>X", function ()
            local cmd_str = "!python -m jupyter_ascending.requests.execute_all "
            local cmd_file = "--filename " .. vim.fn.bufname()
            local exec_cmd = cmd_str .. cmd_file
            vim.api.nvim_command(exec_cmd)
        end)
        nnoremap('<leader>nc', "0o<c-c>o# %%<CR><c-c>zzi")
        nnoremap('<leader>nd', "0i# %% [markdown]<CR><c-c>zzi# ")
    end
})

-- vim.api.nvim_create_autocmd({"BufLeave", "BufWinLeave"}, {
--     group = jp_ascd,
--     pattern = "*.sync.py",
--     callback = function ()
--         vim.keymap.del('n', "<c-x>")
--         vim.keymap.del('n', '<leader><leader>X')
--         vim.keymap.del('n', '<leader>nc')
--         vim.keymap.del('n', '<leader>nd')
--     end
--
-- })
