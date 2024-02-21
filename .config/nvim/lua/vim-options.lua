vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nowrap")

-- visual-multi plugin in multicursor.lua
vim.cmd("let g:VM_maps = {}")
vim.cmd("let g:VM_maps['Find Under']         = '<C-j>'")

-- for css-highlight-colors
vim.cmd("set termguicolors")
vim.cmd("set t_Co=256")

-- for treesitter
vim.filetype.add({
  pattern = { [".*/hypr.*.conf"] = "hyprlang" },
})

vim.g.mapleader = " "


