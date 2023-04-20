-- Setup
require("formatter").setup({
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		kotlin = {
			require("formatter.filetypes.kotlin").ktlint,
		},
		go = {
			require("formatter.filetypes.go").gofmt,
		},
	},
})

-- Map
vim.keymap.set("n", "<leader>f", ":Format", { noremap = true })
vim.keymap.set("n", "<leader>F", ":FormatWrite", { noremap = true })
