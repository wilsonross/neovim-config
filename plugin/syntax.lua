-- Setup
require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "vim", "kotlin", "go", "haskell", "php", "html", "typescript", "javascript", "java", "python", "rust", "svelte", "ocaml", "json" },
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
    },
})
