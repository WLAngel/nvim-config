return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Ggrep", "Glgrep", "Gclog" },
  },
  {
    "github/copilot.vim",
    event = "InsertEnter",
    cmd = "Copilot",
    init = function()
      vim.g.copilot_no_tab_map = true
    end,
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
      {
        "<leader>yd",
        function()
          Snacks.picker.git_diff()
        end,
        desc = "Git Diff (Hunks)",
      },
      {
        "<leader>yD",
        function()
          Snacks.picker.git_diff({ cwd = LazyVim.root.git() })
        end,
        desc = "Git Diff (Root Dir)",
      },
      {
        "<leader>ys",
        function()
          Snacks.picker.git_status()
        end,
        desc = "Git Status",
      },
      {
        "<leader>yS",
        function()
          Snacks.picker.git_stash()
        end,
        desc = "Git Stash",
      },
      {
        "<leader>yi",
        function()
          Snacks.picker.git_log_line()
        end,
        desc = "Git Log Line",
      },
      {
        "<leader>yI",
        function()
          Snacks.picker.git_log({ cwd = LazyVim.root.git(), current = false })
        end,
        desc = "Git Log",
      },
      {
        "<leader>yp",
        function()
          Snacks.picker.git_log_file()
        end,
        desc = "Git Log File",
      },
      {
        "<leader>yP",
        function()
          Snacks.picker.git_log({ cwd = LazyVim.root.git() })
        end,
        desc = "Git Log (Root Dir)",
      },
    },
  },
}
