return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>f",
        function()
          if vim.fs.root(0, ".git") then
            Snacks.picker.git_files()
          else
            LazyVim.pick("files")()
          end
        end,
        desc = "Find Files (git-files)",
        nowait = true,
      },
      { "<leader>F", function() Snacks.picker.files({ root = false }) end, desc = "Find Files (cwd)", nowait = true },
      { "<leader>t", LazyVim.pick("files"), desc = "Find Files (Root Dir)", nowait = true },

      { "<leader>fb", false },
      { "<leader>fB", false },
      { "<leader>fc", false },
      { "<leader>ff", false },
      { "<leader>fF", false },
      { "<leader>fg", false },
      { "<leader>fp", false },
      { "<leader>fr", false },
      { "<leader>fR", false },
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>e", function() Snacks.explorer({ cwd = LazyVim.root() }) end, desc = "Explorer Snacks (root dir)" },
      { "<leader>E", function() Snacks.explorer() end, desc = "Explorer Snacks (cwd)" },
    },
  },
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    cmd = { "Files", "GFiles", "Buffers", "Rg", "RG" },
    config = function()
      -- fzf records the launching window as ppos and restores focus to it on close.
      -- When launched from the snacks explorer, focus returns to the explorer instead
      -- of the opened file. Switch to a regular window first so fzf records it as ppos.
      local function ensure_editor_win()
        if vim.bo.filetype ~= "snacks_picker_list" then
          return
        end
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].filetype ~= "snacks_picker_list" and vim.api.nvim_win_get_config(win).relative == "" then
            vim.api.nvim_set_current_win(win)
            return
          end
        end
      end

      vim.api.nvim_create_user_command("Rg", function(opts)
        ensure_editor_win()
        vim.fn["fzf#vim#grep"](
          "rg --column --line-number --no-heading --color=always --smart-case --hidden --glob=!.git/ -- "
            .. vim.fn["fzf#shellescape"](opts.args),
          vim.fn["fzf#vim#with_preview"](),
          opts.bang and 1 or 0
        )
      end, { bang = true, nargs = "*" })

      vim.api.nvim_create_user_command("RG", function(opts)
        ensure_editor_win()
        vim.fn["fzf#vim#grep2"](
          "rg --column --line-number --no-heading --color=always --smart-case --hidden --glob=!.git/ -- ",
          opts.args,
          vim.fn["fzf#vim#with_preview"](),
          opts.bang and 1 or 0
        )
      end, { bang = true, nargs = "*" })
    end,
  },
}
