-- Disables banner for the built-in file explorer
vim.cmd("let g:netrw_banner = 0")

-- Activates line numbers
vim.opt.nu = true

-- Tabs and indentation settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Wrapping and file backup
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Searching
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI enhancements
vim.opt.termguicolors = true
vim.opt.background = dark
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.clipboard:append("unnamedplus")
vim.opt.hlsearch = true
vim.opt.mouse = "a"

-- EditorConfig support (helps keep formatting consistent across editors if .editorconfig file exists)
vim.g.editorconfig = true
