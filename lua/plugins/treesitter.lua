return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "godot_resource", "gdscript", "gdshader", "lua", "javascript", "typescript", "vim", "rust" },
      highlight = { enable = true },
      indent = { enable = false },
      auto_install = true,
    })
  end
}
