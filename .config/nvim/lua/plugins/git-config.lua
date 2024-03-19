return {
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.keymap.set('n', '<leader>lg', ':LazyGit <CR>')
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      vim.keymap.set("n", "<leader>gc", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})
      vim.keymap.set("n", "<leader>gu", ":Gitsigns reset_hunk<CR>", {})
      vim.keymap.set("n", "<leader>ga", ":Gitsigns stage_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", {})
    end
  },
  {
    "tpope/vim-fugitive"
  }
}
