local autocmd = vim.api.nvim_create_autocmd;
local augroup = vim.api.nvim_create_augroup

-- On file write, source the file and sync the packer plugins
autocmd({"BufWritePost"}, {
  pattern = "plugins.lua",
  command = "source <afile> | PackerSync",
  group = augroup("packer_sync", {clear = true})
})

-- Format rust files on save
autocmd({"BufWritePre"}, {
  pattern = "*.rs",
  command = "RustFmt",
  group = augroup("rustfmt", {clear = true})
})

-- Make it easier to navigate with a terminal open
autocmd({"TermOpen"}, {
  pattern = "term://*",
  callback = function()
    local opts = {buffer = 0}
    vim.keymap.set("t", "<C-space>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  end
})
