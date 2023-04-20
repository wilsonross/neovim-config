
local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.config/nvim/vendor")

-- Theme
Plug("dracula/vim", { as = "dracula" })

-- Fuzzy finder
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", { tag = "0.1.0" })
Plug("nvim-telescope/telescope-fzf-native.nvim", { ["do"] = vim.fn["make"] })

-- Language server config
Plug("neovim/nvim-lspconfig")

-- Syntax highlighting
Plug("nvim-treesitter/nvim-treesitter")

-- Formatting
Plug('mhartington/formatter.nvim')

-- File explorer
Plug('nvim-tree/nvim-tree.lua')

vim.call("plug#end")

-- Globals
vim.g.mapleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
