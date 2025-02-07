return {
    {
        "saghen/blink.cmp",
        dependencies = { "avante.nvim", "saghen/blink.compat" },
        opts = {
            -- sources = {
            --     compat = {
            --         "avante_commands",
            --         "avante_mentions",
            --     },
            --     default = {
            --         "avante_commands",
            --         "avante_mentions",
            --     },
            --     providers = {
            --         avante_commands = {
            --             name = "avante_commands",
            --             module = "blink.compat.source",
            --             score_offset = 90,
            --             opts = {},
            --         },
            --         avante_files = {
            --             name = "avante_commands",
            --             module = "blink.compat.source",
            --             score_offset = 100,
            --             opts = {},
            --         },
            --     },
            -- },
            sources = {
                default = { "avante_commands", "avante_mentions", "avante_files" },
                providers = {
                    avante_commands = {
                        name = "avante_commands",
                        module = "blink.compat.source",
                        score_offset = 90, -- show at a higher priority than lsp
                        opts = {},
                    },
                    avante_files = {
                        name = "avante_commands",
                        module = "blink.compat.source",
                        score_offset = 100, -- show at a higher priority than lsp
                        opts = {},
                    },
                    avante_mentions = {
                        name = "avante_mentions",
                        module = "blink.compat.source",
                        score_offset = 1000, -- show at a higher priority than lsp
                        opts = {},
                    },
                },
            },
        },
        optional = true,
    },
}
