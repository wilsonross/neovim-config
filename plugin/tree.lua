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
		adaptive_size = true,
		width = 40,
		number = true,
		relativenumber = true,
	},
	tab = {
		sync = {
			open = true,
			close = true,
		}
	},
	git = {
		enable = false, -- causes editor to crash during substantial changes
	}
})

local api = require("nvim-tree.api")

-- Mappings
vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", {noremap = true})
vim.keymap.set("n", "<leader>tc", "<cmd>NvimTreeCollapse<CR>", {noremap = true})
