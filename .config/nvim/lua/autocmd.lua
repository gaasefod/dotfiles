local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- on file write, source the file and sync the packer plugins
autocmd({ "BufWritePost" }, {
	pattern = "plugins.lua",
	command = "source <afile> | PackerSync",
	group = augroup("packer_sync", { clear = true }),
})

autocmd({ "CursorHold,CursorHoldI" }, {
	pattern = "*",
	callback = function()
		vim.diagnostic.open_float(nil)
	end,
})

-- make it easier to navigate with a terminal open
autocmd({ "TermOpen" }, {
	pattern = "term://*",
	callback = function()
		local opts = { buffer = 0 }
		vim.keymap.set("t", "<C-space>", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
		vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
		vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
		vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	end,
})

-- open nvim-tree on enter
autocmd({ "VimEnter" }, {
	callback = function()
		require("nvim-tree.api").tree.open()
	end,
})

local function tab_win_closed(winnr)
	local api = require("nvim-tree.api")
	local tabnr = vim.api.nvim_win_get_tabpage(winnr)
	local bufnr = vim.api.nvim_win_get_buf(winnr)
	local buf_info = vim.fn.getbufinfo(bufnr)[1]
	local tab_wins = vim.tbl_filter(function(w)
		return w ~= winnr
	end, vim.api.nvim_tabpage_list_wins(tabnr))
	local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
	if buf_info.name:match(".*NvimTree_%d*$") then
		-- Close all nvim tree on :q
		if not vim.tbl_isempty(tab_bufs) then
			api.tree.close()
		end
	else
		if #tab_bufs == 1 then
			local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
			if last_buf_info.name:match(".*NvimTree_%d*$") then
				vim.schedule(function()
					if #vim.api.nvim_list_wins() == 1 then
						vim.cmd("quit")
					else
						vim.api.nvim_win_close(tab_wins[1], true)
					end
				end)
			end
		end
	end
end

-- if nvim-tree is the only buffer left, close it automatically
autocmd("WinClosed", {
	callback = function()
		local winnr = tonumber(vim.fn.expand("<amatch>"))
		vim.schedule_wrap(tab_win_closed(winnr))
	end,
	nested = true,
})
