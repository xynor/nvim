return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        highlight = {
            enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
            enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
            "json",
            "javascript",
            "typescript",
            "tsx",
            "yaml",
            "html",
            "css",
            "prisma",
            "markdown",
            "markdown_inline",
            "svelte",
            "graphql",
            "bash",
            "lua",
            "vim",
            "dockerfile",
            "gitignore",
            "query",
            "vimdoc",
            "solidity",
            "c",
            "go",
            "gomod",
            "gowork",
            "gosum",
        },
    },
}
