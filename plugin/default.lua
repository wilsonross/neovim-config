-- Options
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.exrc = true
vim.opt.filetype = "on"
vim.opt.syntax = "on"
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.updatetime = 300
vim.opt.cursorline = true
vim.opt.clipboard:append({ "unnamedplus" })
vim.opt.iskeyword:append({ "-" })
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.encoding = "UTF-8"
vim.opt.shm:append({ I = true })
vim.opt.completeopt:remove({ "preview" })
vim.opt.runtimepath:prepend("/Users/ross.wilson/.opam/default/share/ocp-indent/vim")

-- Map
vim.keymap.set("n", "<leader>h", "<c-w>h", { noremap = true })
vim.keymap.set("n", "<leader>j", "<c-w>j", { noremap = true })
vim.keymap.set("n", "<leader>k", "<c-w>k", { noremap = true })
vim.keymap.set("n", "<leader>l", "<c-w>l", { noremap = true })
vim.keymap.set("n", "<leader>w", "<c-w>w", { noremap = true })
