local ok, nvim_tree = pcall(require, "nvim-tree")

if not ok then
	return
end

nvim_tree.setup({
	disable_netrw = true,
	filters = {
		dotfiles = true,
		custom = { "^.git$" },
	},
	view = {
		mappings = {
			list = {
				{ key = "<C-e>", action = "dir_up" },
				{ key = "e", action = "cd" },
			},
		},
	},
})
