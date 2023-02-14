local map = function(mode, key, action, opts)
	local option = { noremap = true, silent = true }
	if opts then
		option = vim.tbl_extend("force", option, opts)
	end
	-- vim.keymap.set allows multiple modes to be set at once
	vim.keymap.set(mode, key, action, option)
end

vim.g.mapleader = " "

-- general
map("n", "<CR>", ":noh<CR>")

-- move lines with Alt + j/k
map({ "n", "i", "v" }, "<A-k>", ":m .-2<CR>")
map({ "n", "i", "v" }, "<A-j>", ":m .+<CR>")

-- lsp
map("n", "gd", vim.lsp.buf.definition)
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gr", ":TroubleToggle lsp_references<CR>")
map("n", "gi", vim.lsp.buf.implementation)
map("n", "<Tab>", vim.lsp.buf.hover)
map("n", "<Leader>f", function()
	vim.lsp.buf.format({ async = true })
end)

-- plugins
map("n", "<Leader>j", ":NvimTreeToggle<CR>")

map("n", "<Leader>k", ":Telescope find_files<CR>")

map("n", "<Leader>t", ":ToggleTerm<CR>")

map("n", "<Leader>a", ":TestSuite<CR>")
map("n", "<Leader>s", ":TestFile<CR>")

map("n", "<Leader>q", ":TroubleToggle<CR>")
map("n", "<Leader>w", ":TroubleToggle workspace_diagnostics<CR>")

-- lazygit floating terminal
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
	float_opts = { border = "rounded" },
	on_open = function()
		vim.cmd("startinsert!")
	end,
})

function Lazygit_toggle()
	lazygit:toggle()
end

map("n", "<Leader>g", Lazygit_toggle)
