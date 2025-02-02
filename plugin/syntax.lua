-- Setup
require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "vim", "kotlin", "go", "php", "html", "typescript", "javascript", "java", "vue", "json", "sql", "rust", "ocaml", "xml", "bash" },
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
    },
})
