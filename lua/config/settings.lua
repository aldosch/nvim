local opt = vim.opt

vim.opt.encoding = "utf-8"

opt.number = false
opt.cursorline = true
opt.signcolumn = "no" -- Hidden by default, toggled with <leader>ln
opt.fillchars = { eob = " " } -- Hide ~ symbols on empty lines

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.inccommand = "split"

opt.hidden = true
opt.autoread = true
opt.backup = true
opt.backupdir = vim.fn.expand("~/.config/nvim/backup//")
opt.directory = vim.fn.expand("~/.config/nvim/swap//")

opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.mousemodel = "extend"

opt.splitbelow = true
opt.splitright = true

opt.showmatch = true
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.completeopt = "menu,menuone,noselect"
opt.pumheight = 10
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.linebreak = true

opt.updatetime = 250
opt.timeoutlen = 300

opt.laststatus = 0
opt.ruler = false
opt.showmode = false

-- Ensure backup and swap directories exist
vim.fn.mkdir(vim.fn.expand("~/.config/nvim/backup"), "p")
vim.fn.mkdir(vim.fn.expand("~/.config/nvim/swap"), "p")

-- Markdown-specific settings
vim.g.markdown_folding = 1
