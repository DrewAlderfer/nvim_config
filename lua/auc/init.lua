vim.api.nvim_create_autocmd(
    "BufEnter",
    {
    pattern = {"*.txt", "*.md"},
    callback = function()
        vim.opt_local.textwidth = 78
        vim.opt_local.colorcolumn = { "+1", "+2", "+3" }
        vim.opt_local.wrap = true
        vim.opt_local.filetype = "help"
        print("Editing in Text mode")
    end
    })
