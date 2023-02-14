local ok, toggleterm = pcall(require, "toggleterm")

if not ok then
	return
end

toggleterm.setup({
	direction = "vertical",
	size = 50,
	autochdir = false,
	start_in_insert = false,
	on_open = function(term)
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", ":ToggleTerm<CR>", { noremap = true, silent = true })
	end,
})
