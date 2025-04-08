return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.gdformat,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "html", "tmpl" }, -- Explicitly handle .tmpl files as HTML
          extra_args = { "--parser", "html" },
        }),
        null_ls.builtins.formatting.black
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
