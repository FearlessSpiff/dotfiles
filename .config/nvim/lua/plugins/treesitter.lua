return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "java", "lua", "vim", "vimdoc", "javascript", "html", "css", "typescript" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
