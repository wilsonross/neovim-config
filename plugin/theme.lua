require("catppuccin").setup({
    integrations = {
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
        dap = {
            enabled = true,
            enable_ui = true,
        }
    },
})

vim.cmd.colorscheme("catppuccin")
