return {
  "bloznelis/before.nvim",
  config = function()
    local before = require("before")
    before.setup()

    vim.keymap.set("n", "<C-d>", before.jump_to_last_edit, {})
    vim.keymap.set("n", "<C-t>", before.jump_to_next_edit, {})
  end,
}
