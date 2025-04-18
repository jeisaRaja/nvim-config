return {
  "quarto-dev/quarto-nvim",
  dependencies = {
    "jmbuhr/otter.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("quarto").activate()
  end,
}
