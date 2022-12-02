local popup = require "plenary.popup"

local M = {}

function M.runpy ()

    if not vim.api.nvim_buf_is_loaded(vim.fn.bufnr("py:STDOUT")) then
        vim.api.nvim_buf_set_name(vim.api.nvim_create_buf(true, true), "py:STDOUT")
    end
    local pop_buf = vim.fn.bufnr("py:STDOUT")

    local run_path = vim.api.nvim_buf_get_name(0)
    local pop_win = popup.create(pop_buf, {
       line = 0,
       col = 0,
       minwidth = 100,
       minheight = 30,
       maxheight = 30,
       highlight = "Normal",
       borderhighlight = "Normal",
       borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
       border = true,
    })
    vim.api.nvim_win_set_buf(pop_win, pop_buf)
    vim.api.nvim_buf_set_lines(pop_buf, 0, -1, false, {""})
    vim.fn.jobstart({"python", run_path}, {
        stdout_buffered = true,
        on_stdout = function( _, data)
            if data then
                for i, v in ipairs(data) do
                    data[i] = v:sub(1, -2)
                end
                vim.api.nvim_buf_set_lines(pop_buf, -1, -1, false, data)
            end
        end,
        on_stderr = function( _, data)
            if data then
                vim.api.nvim_buf_set_lines(pop_buf, -1, -1, false, data)
            end
        end,
    })
end

return M
