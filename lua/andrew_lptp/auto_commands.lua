-- This Autocmd listens for a *.py write and then runs the file in python.exe

vim.api.nvim_create_autocmd("BufWritePost",{

    group = vim.api.nvim_create_augroup("PythonEx", {clear = true}),
    pattern = "*.py",
    callback = function ()
            local cur_win = vim.api.nvim_get_current_win()
            local cur_buf = vim.api.nvim_win_get_buf(cur_win)
            local cbuf_path = vim.api.nvim_buf_get_name(cur_buf)
            if not vim.api.nvim_buf_is_loaded(vim.fn.bufnr("Python_Dump")) then
                vim.api.nvim_buf_set_name(vim.api.nvim_create_buf(true, true), "Python_Dump")
            end
            local pyBuf = vim.fn.bufnr("Python_Dump")
            local findBuf = vim.fn.win_findbuf(pyBuf)
            if findBuf[1] then
                vim.api.nvim_buf_set_lines(pyBuf, 0, -1, false, {"..."})
            else
                vim.cmd("bel split")
                vim.api.nvim_win_set_height(0, 15)
                vim.api.nvim_set_current_buf(pyBuf)
                vim.api.nvim_buf_set_lines(pyBuf, 0, -1, false, {"..."})
            end
            vim.fn.jobstart({"python", cbuf_path}, {
                stdout_buffered = true,
                on_stdout = function(_, data)
                    if data then
                        vim.api.nvim_buf_set_lines(pyBuf, -1, -1, false, data)
                    end
                end,
                on_stderr = function(_, data)
                    if data then
                        vim.api.nvim_buf_set_lines(pyBuf, -1, -1, false, data)
                    end
                end,
            })
        end,
})
