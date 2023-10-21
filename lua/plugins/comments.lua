return {
    {
        'numToStr/Comment.nvim',
        lazy = false,
        opts = {
            ignore = "^$"
        },
        config = function()
            require("Comment").setup()
        end
    }
}
