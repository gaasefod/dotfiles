local ok, null_ls = pcall(require, "null-ls")

if not ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	border = "rounded",
	sources = {
		-- formatting
		formatting.stylua,
		formatting.prettierd,
		formatting.eslint_d,
		formatting.black,
		formatting.rustfmt,

		-- diagnostics
		diagnostics.eslint_d,
	},
})
