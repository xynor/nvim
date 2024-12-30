return {
    "stevearc/conform.nvim",
    opts = function()
        local opts = {
            formatters_by_ft = {
                -- javascript = { "prettier" },
                -- typescript = { "prettier" },
                -- javascriptreact = { "prettier" },
                -- typescriptreact = { "prettier" },
                -- svelte = { "prettier" },
                -- css = { "prettier" },
                -- html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                -- graphql = { "prettier" },
                -- liquid = { "prettier" },
                lua = { "stylua" },
                solidity = { "forge" },
                toml = { "taplo" },
                go = { "goimports", "gofumpt" },
                -- python = { "isort", "black" },
                sh = { "shfmt" },
                zsh = { "shfmt" },
            },
            formatters = {
                forge = {
                    command = "forge",
                    args = { "fmt", "$FILENAME" },
                    stdin = false,
                },
                prettier = {
                    command = vim.fn.expand("~/.local/share/nvim/mason/bin/prettier"),
                },
            },

            -- format_on_save = {
            --   lsp_fallback = true,
            --   async = false,
            --   timeout_ms = 1000,
            -- },
        }

        --vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        --  conform.format({
        --    lsp_fallback = true,
        --    async = false,
        --    timeout_ms = 1000,
        --  })
        -- end, { desc = "Format file or range (in visual mode)" })
        return opts
    end,
}
