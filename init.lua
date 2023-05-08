-- Import
local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.config/nvim/vendor")

-- Theme
Plug("catppuccin/nvim", { as = "catppuccin" })

-- Fuzzy finder
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", { tag = "0.1.0" })
Plug("nvim-telescope/telescope-fzf-native.nvim", { ["do"] = vim.fn["make"] })

-- Language server config
Plug("neovim/nvim-lspconfig")

-- Syntax highlighting
Plug("nvim-treesitter/nvim-treesitter")

-- File explorer
Plug("nvim-tree/nvim-tree.lua")

-- Status bar
Plug("freddiehaddad/feline.nvim")

-- Icons
Plug("nvim-tree/nvim-web-devicons")

-- Debugger
Plug("mfussenegger/nvim-dap")
Plug("rcarriga/nvim-dap-ui")
Plug("mxsdev/nvim-dap-vscode-js")

-- Git
Plug("lewis6991/gitsigns.nvim")

vim.call("plug#end")

-- Globals
vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
