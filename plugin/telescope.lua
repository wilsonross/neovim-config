local telescope = require("telescope")
local builtin = require("telescope.builtin")
local config = require("telescope.config")

local vimgrep_arguments = { 
	unpack(config.values.vimgrep_arguments) 
}

-- Show ignored files
table.insert(vimgrep_arguments, "-uuu")

telescope.setup {
    defaults = {
        initial_mode = "normal",
		vimgrep_arguments = vimgrep_arguments,
        preview = {
            msg_bg_fillchar = " ", -- Removes binary preview background
        },
    },
}

-- Mappings
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
