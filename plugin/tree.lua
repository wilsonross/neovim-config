-- Import
local api = require("nvim-tree.api")
local tree = require("nvim-tree")

-- Setup
tree.setup({
	git = {
		ignore = false,
		enable = false, -- Causes editor to crash during substantial changes
	},
	filters = {
		custom = {
			"^.git$",
		},
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
		},
	},
	renderer = {
		icons = {
			show = {
				file = false,
				folder = false,
				folder_arrow = false,
				git = false,
			},
		},
	},
})

-- Map
vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tc", "<cmd>NvimTreeCollapse<CR>", { noremap = true })
vim.keymap.set("n", "<leader>c", api.fs.clear_clipboard, { noremap = true })
