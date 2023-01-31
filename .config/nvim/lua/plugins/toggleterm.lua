require("toggleterm").setup {
	direction = "float",
  float_opts = {
    border = "double",
  },
	autochdir = false,
  start_in_insert = false,
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
}
