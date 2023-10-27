return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {
                    config = {
                        disable = {},
                    },
                },
                ["core.concealer"] = {},
                ["core.summary"] = {},
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                    },
                },
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            writing = "~/text/writing",
                            notes = "~/text/notes",
                            wdc = "~/text/wholedaycatalogue"
                        },
                        default_workspace = "writing",
                        index = "toc.norg",
                    },
                },
            },
        }
    end
}
