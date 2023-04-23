-- Setup
require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "vim", "kotlin", "go", "haskell", "php", "html" },
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
    },
})
