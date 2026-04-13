return {
  -- Remove LazyVim's default group labels that conflict with custom keymap layout
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.spec = vim.tbl_filter(function(item)
        return not (type(item) == "table" and vim.tbl_contains({ "<leader>c", "<leader>d", "<leader>f", "<leader>g", "<leader>q", "<leader>w" }, item[1]))
      end, opts.spec or {})
      return opts
    end,
  },
}
