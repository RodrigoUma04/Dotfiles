return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }
                local keymap = vim.keymap.set

                keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
                keymap("n", "gD", vim.lsp.buf.declaration, opts)
                keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
                keymap("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
                keymap("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

                keymap("n", "K", vim.lsp.buf.hover, opts)
                keymap("i", "<C-h>", vim.lsp.buf.signature_help, opts)

                keymap({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, opts)
                keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
                keymap("n", "<leader>d", vim.diagnostic.open_float, opts)
                keymap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
                keymap("n", "<leader>rs", ":LspRestart<CR>", opts)
            end,
        })

        local signs = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰠠 ",
            [vim.diagnostic.severity.INFO] = " ",
        }

        vim.diagnostic.config({
            signs = { text = signs },
            virtual_text = true,
            underline = true,
            update_in_insert = false,
        })

        -- LSP server configurations
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        lspconfig.ts_ls.setup({
            capabilities = capabilities,
            root_dir = function(fname)
                local util = require("lspconfig.util")
                return util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
            end,
            init_options = {
                preferences = {
                    includeCompletionsWithSnippetText = true,
                    includeCompletionsForImportStatements = true,
                },
            },
        })

        lspconfig.html.setup({ capabilities = capabilities })
        lspconfig.cssls.setup({ capabilities = capabilities })
        lspconfig.tailwindcss.setup({ capabilities = capabilities })
        lspconfig.omnisharp.setup({ capabilities = capabilities })
        lspconfig.dartls.setup({ capabilities = capabilities })
        lspconfig.jdtls.setup({ capabilities = capabilities })
    end,
}
