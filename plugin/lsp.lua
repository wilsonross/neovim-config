-- Import
local lspconfig = require("lspconfig")

-- Setup
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.kotlin_language_server.setup({
    settings = {
        kotlin = {
            compiler = {
                jvm = {
                    target = "17",
                },
            },
        },
    },
})
lspconfig.gopls.setup({})
lspconfig.intelephense.setup({})
lspconfig.html.setup({
    filetypes = {
        "twig",
    },
})
lspconfig.tsserver.setup({
    init_options = {
        completionDisableFilterText = true,
    }
})
lspconfig.jdtls.setup({})
lspconfig.vuels.setup({})
lspconfig.jsonls.setup({
    capabilities = capabilities,
})
lspconfig.rust_analyzer.setup({})
lspconfig.pyright.setup({})
lspconfig.ocamllsp.setup({})

-- Map
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Map after server started
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Disables LSP highlight so treesitter can be used
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil

        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        local opts = { buffer = ev.buf }

        -- Open in a new tab
        vim.api.nvim_buf_set_keymap(0, "n", "gD", "<cmd>tab split | lua vim.lsp.buf.declaration()<CR>", {})
        vim.api.nvim_buf_set_keymap(0, "n", "gd", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", {})
        vim.api.nvim_buf_set_keymap(0, "n", "gi", "<cmd>tab split | lua vim.lsp.buf.implementation()<CR>", {})

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
        end, opts)

        -- Format and write to buffer
        vim.keymap.set("n", "<leader>F", function()
            vim.lsp.buf.format()
            vim.api.nvim_buf_call(vim.api.nvim_get_current_buf(), function()
                vim.cmd("write")
            end)
        end, opts)
    end,
})
