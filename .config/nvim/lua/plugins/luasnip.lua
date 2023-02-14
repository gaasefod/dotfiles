local ok, luasnip = pcall(require, "luasnip")

if not ok then
	return
end

local HOME = vim.fn.expand("$HOME")

require("luasnip.loaders.from_lua").lazy_load({ paths = HOME .. "/.config/nvim/snippets/" })

luasnip.config.set_config({
	enable_autosnippets = true,
})
