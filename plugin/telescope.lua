local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup {
    defaults = {
        preview = {
            msg_bg_fillchar = " ", -- Removes binary preview background
        },
        initial_mode = "normal",
    },
}

-- Mappings
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
