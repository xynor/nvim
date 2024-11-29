return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-live-grep-args.nvim",
            },
        },
        opts = function(_, opts)
            local lga_actions = require("telescope-live-grep-args.actions")
            opts.extensions = {
                live_grep_args = {
                    auto_quoting = true, -- enable/disable auto-quoting
                    -- define mappings, e.g.
                    mappings = { -- extend mappings
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                            ["<C-h>"] = lga_actions.quote_prompt({ postfix = " --hidden " }),
                            ["<C-n>"] = lga_actions.quote_prompt({ postfix = " --no-ignore " }),
                        },
                    },
                    -- ... also accepts theme settings, for example:
                    -- theme = "dropdown", -- use dropdown theme
                    -- theme = { }, -- use own theme spec
                    -- layout_config = { mirror=true }, -- mirror preview pane
                },
            }
        end,
        keys = {
            {
                "<leader>/",
                "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
                desc = "Grep (Root Dir)",
            },
            -- {
            --     "<leader>sw",
            --     "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<CR>",
            --     desc = "Word (Root Dir)",
            -- },
            {
                "<leader>sw",
                "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_visual_selection()<CR>",
                mode = "v",
                desc = "Selection (Root Dir)",
            },
        },
        config = function(_, opts)
            local tele = require("telescope")
            tele.setup(opts)
            tele.load_extension("live_grep_args")
        end,
    },
}
