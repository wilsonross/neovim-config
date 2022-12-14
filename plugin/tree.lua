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
	}
})

local api = require("nvim-tree.api")

-- Mappings
vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", {noremap = true})
vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeFocus<CR>", {noremap = true})
vim.keymap.set("n", "<leader>tc", "<cmd>NvimTreeCollapse<CR>", {noremap = true})

vim.keymap.set("n", "<leader>c", function ()
	api.clear_clipboard()
	api.fs.copy()
end, {noremap = true})

vim.keymap.set("n", "<leader>x", function ()
	api.clear_clipboard()
	api.fs.cut()
end, {noremap = true})
