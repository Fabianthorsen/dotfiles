local opt = vim.opt

-- Line numbers
opt.relativenumber = true
opt.number = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Text wrap
opt.wrap = false

-- Case
opt.smartcase = true
opt.ignorecase = true

opt.signcolumn = "no"

-- For theme
opt.termguicolors = true

-- Clipboard settings
opt.clipboard:append("unnamedplus")

-- Window split
opt.splitright = true
opt.splitbelow = true

vim.g.python3_host_prog = "~/.pyenv/versions/"
