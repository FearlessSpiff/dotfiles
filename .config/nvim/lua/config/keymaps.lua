local map = vim.keymap.set

-- Move to window using the <ctrl> Arrow keys
map("n", "<A-Left>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<A-Down>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<A-Up>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<A-Right>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- buffers
map("n", "<S-Left>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-Right>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
