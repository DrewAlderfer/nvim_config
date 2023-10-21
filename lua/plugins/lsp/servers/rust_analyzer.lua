return {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {
    "rustup", "run", "stable", "rust_analyzer",
    }
}
