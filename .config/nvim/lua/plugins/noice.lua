local ok, noice = pcall(require, "noice")

if not ok then
	return
end

noice.setup({
	cmdline = {
		view = "cmdline",
		format = {
			search_down = {
				view = "cmdline",
			},
			search_up = {
				view = "cmdline",
			},
		},
	},
	messages = {
		enabled = true,
	},
	popupmenu = {
		enabled = false,
	},
	notify = {
		enabled = false,
	},
	lsp = {
		progress = {
			enabled = true,
		},
		signature = {
			enabled = true,
			auto_open = {
				enabled = false,
			},
		},

		-- override markdown rendering so that cmp and other plugins use Treesitter
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = true,
		inc_rename = false,
		lsp_doc_border = true,
	},
})
