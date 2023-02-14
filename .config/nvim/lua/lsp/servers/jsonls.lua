local ok, lspconfig = pcall(require, "lspconfig")
local cmp_ok, cmp = pcall(require, "cmp_nvim_lsp")

if not ok or not cmp_ok then
	return
end

lspconfig.jsonls.setup({
	capabilities = cmp.default_capabilities(),
})
