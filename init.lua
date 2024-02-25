-- Import
local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.config/nvim/vendor")

-- Theme
Plug("catppuccin/nvim", { as = "catppuccin", tag = "stable" })

-- Fuzzy finder
Plug("nvim-lua/plenary.nvim", { tag = "v0.1.4" })
Plug("nvim-telescope/telescope.nvim", { tag = "0.1.5" })
Plug("nvim-telescope/telescope-fzf-native.nvim", { ["do"] = vim.fn["make"], commit = "6c921ca" })

-- Language server config
Plug("neovim/nvim-lspconfig", { commit = "ec7d51a" })

-- Syntax highlighting
Plug("nvim-treesitter/nvim-treesitter", { tag = "v0.9.2" })

-- File explorer
Plug("nvim-tree/nvim-tree.lua", { tag = "nvim-tree-v1.0.0" })

-- Status bar
Plug("freddiehaddad/feline.nvim", { tag = "v1.4.0" })

-- Icons
Plug("nvim-tree/nvim-web-devicons", { tag = "nvim-web-devicons-v0.99.0" })

-- Debugger
Plug("mfussenegger/nvim-dap", { tag = "0.7.0" })
Plug("rcarriga/nvim-dap-ui", { tag = "v3.9.3" })

-- Git
Plug("lewis6991/gitsigns.nvim", { tag = "v0.7" })

vim.call("plug#end")

-- Globals
vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.omni_sql_no_default_maps = 1
vim.g.nomagic = 1
