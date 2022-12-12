require("nvim-tree").setup({
    git = {
        ignore = false,
    },
	filters = { 
		custom = { 
			"^.git$" 
		} 
	}
})

-- Mappings
vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", {noremap = true})
vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeFocus<CR>", {noremap = true})
vim.keymap.set("n", "<leader>tr", "<cmd>NvimTreeRefresh<CR>", {noremap = true})
vim.keymap.set("n", "<leader>tcl", "<cmd>NvimTreeCollapse<CR>", {noremap = true})
