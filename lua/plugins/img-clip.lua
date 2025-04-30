return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      -- Path options
      dir_path = "Files",             -- specify the base directory
      relative_template_path = false, -- make sure we don't get relative paths like `../Files/`
      template = "$FILE_NAME",        -- only include the file name without path in the markdown link
    },
    filetypes = {
      markdown = {
        dir_path = "Files",             -- specify the base directory
        relative_template_path = false, -- make sure we don't get relative paths like `../Files/`
        template = "![[$FILE_NAME]]",   -- only include the file name in the markdown
      },
    },
  },
  keys = {
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
  },
}
