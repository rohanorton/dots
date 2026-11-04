return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    skip_confirm_for_simple_edits = true,
    -- prompt_save_on_select_new_entry = false,
  },
  keys = {
    {
      "-",
      "<cmd>Oil<cr>",
      desc = "Open parent directory",
    },
  },
}
