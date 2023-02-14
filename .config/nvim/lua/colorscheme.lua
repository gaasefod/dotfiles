-- gruvbox
vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_better_performance = 1
vim.cmd([[ colorscheme gruvbox-material ]])

-- overwrite the floating window background colors to none
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = "#d4be98" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#d4be98" })
vim.api.nvim_set_hl(0, "ErrorFloat", { bg = "none", fg = "#ea6962" })
vim.api.nvim_set_hl(0, "WarningFloat", { bg = "none", fg = "#d8a657" })
vim.api.nvim_set_hl(0, "InfoFloat", { bg = "none", fg = "#7daea3" })
vim.api.nvim_set_hl(0, "HintFloat", { bg = "none", fg = "#a9b665" })
