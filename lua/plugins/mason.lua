return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "gomodifytags", "impl", "goimports", "gofumpt", "delve", "gotests", "shellcheck" },
        },
    },
}
