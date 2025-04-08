return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- Your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    -- Set up Trouble here
    require("trouble").setup {}

    -- Key mapping for toggling Trouble
    vim.keymap.set('n', '<leader>t', ':Trouble diagnostics toggle<CR>', { noremap = true, silent = true })
  end,
}

