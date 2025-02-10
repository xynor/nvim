return {
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- set this if you want to always pull the latest change
        opts = {
            provider = "groq",
            auto_suggestions_provider = "openai", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
            openai = {
                -- endpoint = "https://api.deepseek.com/v1",
                -- model = "deepseek-chat",
                -- endpoint = "https://api.groq.com/openai/v1",
                endpoint = "https://openapi.monica.im/v1",
                -- model = "claude-3-5-sonnet-20241022",
                model = "gpt-4o-mini",
                timeout = 60000, -- Timeout in milliseconds
                temperature = 0,
                -- max_tokens = 4096,
                max_tokens = 16384,
                -- optional
                api_key_name = "OPENAI_API_KEY", -- default OPENAI_API_KEY if not set
            },
            vendors = {
                groq = {
                    __inherited_from = "openai",
                    api_key_name = "GROQ_API_KEY",
                    endpoint = "https://api.groq.com/openai/v1",
                    model = "deepseek-r1-distill-llama-70b",
                    timeout = 60000, -- Timeout in milliseconds
                    temperature = 0,
                    max_tokens = 4096,
                },
            },
            windows = {
                width = 50,
                -- edit = {
                --     start_insert = false, -- Start insert mode when opening the edit window
                -- },
                -- ask = {
                --     start_insert = false, -- Start insert mode when opening the ask window
                -- },
            },
            behaviour = {
                auto_suggestions = false, -- Experimental stage
                auto_set_highlight_group = true,
                auto_set_keymaps = true,
                auto_apply_diff_after_generation = false,
                support_paste_from_clipboard = true,
                minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
                enable_token_counting = true, -- Whether to enable token counting. Default to true.
            },
            mappings = {
                submit = {
                    insert = "<C-CR>",
                },
            },
            web_search_engine = {
                provider = "serpapi", -- tavily or serpapi
            },
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua", -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
}
