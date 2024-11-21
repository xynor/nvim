return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = {
                enabled = false,
            },
            diagnostics = { virtual_text = { prefix = "icons" } },
            capabilities = {
                textDocument = {
                    foldingRange = {
                        dynamicRegistration = false,
                        lineFoldingOnly = true,
                    },
                    completion = {
                        completionItem = {
                            snippetSupport = true,
                        },
                    },
                },
            },
            showMessage = {
                messageActionItem = {
                    additionalPropertiesSupport = true,
                },
            },
            flags = {
                debounce_text_changes = 150,
            },
            servers = {
                -- rust_analyzer = {
                --     settings = {
                --         ["rust-analyzer"] = {
                --             procMacro = { enable = true },
                --             cargo = { allFeatures = true },
                --             checkOnSave = {
                --                 command = "clippy",
                --                 extraArgs = { "--no-deps" },
                --             },
                --         },
                --     },
                -- },
                gopls = {
                    filetypes = { "go", "gomod", "gowork", "gotmpl" },
                    root_dir = require("lspconfig").util.root_pattern("go.work", "go.mod", ".git"),
                    settings = {
                        gopls = {
                            gofumpt = true,
                            codelenses = {
                                gc_details = false,
                                generate = true,
                                regenerate_cgo = true,
                                run_govulncheck = true,
                                test = true,
                                tidy = true,
                                upgrade_dependency = true,
                                vendor = true,
                            },
                            hints = {
                                assignVariableTypes = true,
                                compositeLiteralFields = true,
                                compositeLiteralTypes = true,
                                constantValues = true,
                                functionTypeParameters = true,
                                parameterNames = true,
                                rangeVariableTypes = true,
                            },
                            analyses = {
                                fieldalignment = true,
                                nilness = true,
                                unusedparams = true,
                                unusedwrite = true,
                                useany = true,
                                shadow = true,
                            },
                            usePlaceholders = true,
                            completeUnimported = true,
                            staticcheck = true,
                            -- directoryFilters = {
                            --     "-.git",
                            --     "-.vscode",
                            --     "-.idea",
                            --     "-.vscode-test",
                            --     "-node_modules",
                            --     "-.nvim",
                            -- },
                            semanticTokens = true,
                        },
                    },
                },
                solidity_ls_nomicfoundation = {
                    cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
                    filetypes = { "solidity" },
                    -- root_dir = require("lspconfig").util.find_git_ancestor,
                    root_dir = require("lspconfig").util.root_pattern(
                        "foundry.toml",
                        "hardhat.config.ts",
                        "hardhat.config.js"
                    ),
                },
                solidity_ls = {
                    filetypes = { "solidity" },
                    -- root_dir = require("lspconfig").util.find_git_ancestor,
                    root_dir = require("lspconfig").util.root_pattern(
                        "foundry.toml",
                        "hardhat.config.ts",
                        "hardhat.config.js"
                    ),
                },
            },
        },
    },
    -- {
    --     "nvimtools/none-ls.nvim", -- none-ls is an active community fork of null-ls
    --     opts = function(_, opts)
    --         local nls = require("null-ls")
    --         opts.sources = vim.list_extend(opts.sources or {}, {
    --             nls.builtins.code_actions.gomodifytags,
    --             nls.builtins.code_actions.impl,
    --         })
    --         return opts
    --     end,
    -- },
}
