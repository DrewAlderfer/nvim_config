local Util = require("util")

return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        },
        keys = {
            {"<leader>e", ":Neotree toggle<CR>", desc = "Neotree toggle" },
        },
        config = function ()
            require("neo-tree").setup()
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        version = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                enabled = vim.fn.executable("make") == 1,
                config = function()
                    Util.on_load("telescope.nvim", function()
                        require("telescope").load_extension("fzf")
                    end)
                end,
            },
        },
    },
    {
        "nvim-pack/nvim-spectre",
    },
}
