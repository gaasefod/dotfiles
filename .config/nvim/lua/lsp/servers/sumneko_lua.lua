local ok, lspconfig = pcall(require, "lspconfig")
local cmp_ok, cmp = pcall(require, "cmp_nvim_lsp")

if not ok or not cmp_ok then
	return
end

local USER = vim.fn.expand("$USER")

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("unix") == 1 then
	sumneko_root_path = "/home/" .. USER .. "/.local/bin/lua-language-server"
	sumneko_binary = "/home/" .. USER .. "/.local/bin/lua-language-server/bin/lua-language-server"
else
	print("Unsupported system for sumneko lls")
end

lspconfig.sumneko_lua.setup({
	capabilities = cmp.default_capabilities(),
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
			-- let null-ls handle formatting
			format = {
				enable = false,
			},
		},
	},
})
