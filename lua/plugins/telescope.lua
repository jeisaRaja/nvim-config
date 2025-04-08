return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
      vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
      vim.keymap.set('n', '<leader>gs', builtin.git_status, {})

      vim.keymap.set('n', '<leader>lr', builtin.lsp_references, {})
      vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {})
      vim.keymap.set('n', '<leader>lw', builtin.lsp_workspace_symbols, {})
      vim.keymap.set('n', '<leader>ld', builtin.diagnostics, {})
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        defaults = { file_ignore_patterns = { "node_modules" } },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {

            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
