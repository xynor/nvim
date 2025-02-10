return {
    {
        "maxandron/goplements.nvim",
        ft = "go",
        opts = {
            -- The prefixes prepended to the type names
            prefix = {
                interface = "implemented by: ",
                struct = "implements: ",
            },
            -- Whether to display the package name along with the type name (i.e., builtins.error vs error)
            display_package = true,
            -- The namespace to use for the extmarks (no real reason to change this except for testing)
            namespace_name = "goplements",
            -- The highlight group to use (if you want to change the default colors)
            -- The default links to DiagnosticHint
            highlight = "@number",
        },
    },
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
                    handlers = {
                        ["textDocument/publishDiagnostics"] = function() end,
                    },
                    diagnostics = {
                        virtual_text = false,
                        signs = false,
                    },
                },
                bashls = {
                    filetypes = { "sh" },
                },
            },
            setup = {
                ---@diagnostic disable-next-line: unused-local
                gopls = function(_, opts)
                    -- workaround for gopls not supporting semanticTokensProvider
                    -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
                    LazyVim.lsp.on_attach(function(client, _)
                        if not client.server_capabilities.semanticTokensProvider then
                            local semantic = client.config.capabilities.textDocument.semanticTokens
                            client.server_capabilities.semanticTokensProvider = {
                                full = true,
                                legend = {
                                    ---@diagnostic disable-next-line: need-check-nil
                                    tokenTypes = semantic.tokenTypes,
                                    ---@diagnostic disable-next-line: need-check-nil
                                    tokenModifiers = semantic.tokenModifiers,
                                },
                                range = true,
                            }
                        end
                    end, "gopls")
                    -- end workaround
                end,
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
