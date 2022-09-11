require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "rust", "python", "javascript", "markdown"},
    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
