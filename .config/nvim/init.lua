-- general
require("autocmd")
require("colorscheme")
require("mappings")
require("options")
require("plugins")

-- plugins
require("plugins.gitsigns")
require("plugins.indent-blankline")
require("plugins.leap")
require("plugins.lualine")
require("plugins.luasnip")
require("plugins.noice")
require("plugins.nvim-tree")
require("plugins.nvim-treesitter")
require("plugins.telescope")
require("plugins.toggleterm")
require("plugins.vim-test")

-- lsp config
require("lsp.null-ls")
require("lsp.nvim-cmp")
require("lsp.nvim-lspconfig")

-- lsp servers
require("lsp.servers.bashls")
require("lsp.servers.clangd")
require("lsp.servers.cssls")
require("lsp.servers.html")
require("lsp.servers.jsonls")
require("lsp.servers.pyright")
require("lsp.servers.rust_analyzer")
require("lsp.servers.sumneko_lua")
require("lsp.servers.tsserver")
