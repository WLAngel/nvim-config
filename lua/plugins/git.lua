return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Ggrep", "Glgrep", "Gclog" },
  },
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>gd", false },
      { "<leader>gD", false },
      { "<leader>gs", false },
      { "<leader>gS", false },
      { "<leader>gi", false },
      { "<leader>gI", false },
      { "<leader>gp", false },
      { "<leader>gP", false },
      { "<leader>yd", false },
      { "<leader>yD", false },
      { "<leader>ys", false },
      { "<leader>yS", false },
      { "<leader>yi", false },
      { "<leader>yI", false },
      { "<leader>yp", false },
      { "<leader>yP", false },
      {
        "<leader>hd",
        function()
          Snacks.picker.git_diff()
        end,
        desc = "Git Diff (Hunks)",
      },
      {
        "<leader>hD",
        function()
          Snacks.picker.git_diff({ cwd = LazyVim.root.git() })
        end,
        desc = "Git Diff (Root Dir)",
      },
      {
        "<leader>hs",
        function()
          Snacks.picker.git_status()
        end,
        desc = "Git Status",
      },
      {
        "<leader>hS",
        function()
          Snacks.picker.git_stash()
        end,
        desc = "Git Stash",
      },
      {
        "<leader>hi",
        function()
          Snacks.picker.git_log_line()
        end,
        desc = "Git Log Line",
      },
      {
        "<leader>hI",
        function()
          Snacks.picker.git_log({ cwd = LazyVim.root.git(), current = false })
        end,
        desc = "Git Log",
      },
      {
        "<leader>hp",
        function()
          Snacks.picker.git_log_file()
        end,
        desc = "Git Log File",
      },
      {
        "<leader>hP",
        function()
          Snacks.picker.git_log({ cwd = LazyVim.root.git() })
        end,
        desc = "Git Log (Root Dir)",
      },
    },
  },
}
