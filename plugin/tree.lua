require("nvim-tree").setup({
    git = {
        ignore = false,
    },
	filters = { 
		custom = { 
			"^.git$" 
		} 
	},
	view = {
		width = 40,
	},
	tab = {
		sync = {
			open = true,
			close = true,
		}
	}
})

local api = require("nvim-tree.api")

-- Mappings
vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", {noremap = true})
vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeFocus<CR>", {noremap = true})
vim.keymap.set("n", "<leader>tc", "<cmd>NvimTreeCollapse<CR>", {noremap = true})
