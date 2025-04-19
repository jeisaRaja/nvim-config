return {
  {
    "Shougo/deoplete.nvim",
    build = ":UpdateRemotePlugins",
    config = function()
      vim.g["deoplete#enable_at_startup"] = 1
      vim.g["deoplete#sources"] = {
        _ = { "buffer", "file", "omni" }
      }
    end,
  },
  {
    "wlangstroth/vim-racket",
    ft = { "racket" },
  },
}
