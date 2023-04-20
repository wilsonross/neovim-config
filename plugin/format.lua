-- Setup
require("formatter").setup({
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		kotlin = {
			require("formatter.filetypes.kotlin").ktlint,
		},
	},
})

-- Map
vim.keymap.set("n", "<leader>f", ":Format", { noremap = true })
vim.keymap.set("n", "<leader>F", ":FormatWrite", { noremap = true })
