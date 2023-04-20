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
		haskell = {
			require("formatter.filetypes.haskell").stylish_haskell,
		},
	},
})

-- Map
vim.keymap.set("n", "<leader>f", ":Format", { noremap = true })
vim.keymap.set("n", "<leader>F", ":FormatWrite", { noremap = true })
