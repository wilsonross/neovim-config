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
vim.opt.shm:append({ I = true })
vim.opt.completeopt:remove({ "preview" })
vim.opt.runtimepath:prepend("/Users/ross.wilson/.opam/default/share/ocp-indent/vim")

-- Map
vim.keymap.set("n", "<leader>h", "<c-w>h", { noremap = true })
vim.keymap.set("n", "<leader>j", "<c-w>j", { noremap = true })
vim.keymap.set("n", "<leader>k", "<c-w>k", { noremap = true })
vim.keymap.set("n", "<leader>l", "<c-w>l", { noremap = true })
vim.keymap.set("n", "<leader>w", "<c-w>w", { noremap = true })

-- Exceptions
local function set_iskeyword_for_php()
  vim.opt_local.iskeyword:remove("-")
  vim.opt.iskeyword:append({ "$" })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = set_iskeyword_for_php,
  group = vim.api.nvim_create_augroup("PHPIsKeyword", { clear = true }),
})

-- Macros
local function add_debug_lines()
  local start_line, start_col = unpack(vim.fn.getpos("'<"), 2, 3)
  local end_line, end_col = unpack(vim.fn.getpos("'>"), 2, 3)
  local lines = vim.fn.getline(start_line, end_line)

  if #lines == 1 then
    local line = lines[1]
    local selected_var = line:sub(start_col, end_col)
    local new_lines = {
      "echo '<pre>';",
      "die(print_r(" .. selected_var .. ", true));"
    }
    vim.api.nvim_buf_set_lines(0, start_line, start_line, false, new_lines)
  else
    vim.api.nvim_err_writeln("Multi-line selection is not supported for this macro.")
  end
end

vim.api.nvim_create_user_command('AddDebugLines', add_debug_lines, { range = true })
vim.api.nvim_set_keymap('v', '<leader>d', ':AddDebugLines<CR>', { noremap = true, silent = true })
