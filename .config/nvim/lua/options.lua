local set = vim.opt

-- indentation
set.autoindent = true
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true

-- search
set.incsearch = true
set.ignorecase = true
set.smartcase = true

-- editor
set.syntax = "on"
set.termguicolors = true
set.number = true
set.splitright = true
set.cursorline = true
set.completeopt = "menu,menuone,noselect"

set.list = true
set.listchars:append("eol:↴")
set.updatetime = 250

-- misc
set.ttyfast = true
set.clipboard = "unnamedplus"
