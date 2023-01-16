-- On file write, source the file and sync the packer plugins
vim.cmd([[
  augroup packer_sync
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Format rust files on save
vim.cmd([[
  augroup rustfmt
    autocmd!
    autocmd BufWritePre *.rs :RustFmt 
  augroup end
]])

-- Make it easier to navigate with a terminal open
vim.cmd([[autocmd! TermOpen term://* lua set_terminal_keymaps()]])
