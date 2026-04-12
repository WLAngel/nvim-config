return {
  { "akinsho/bufferline.nvim", enabled = false },
  {
    "lunarvim/lunar.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "lunar",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local search_count = {
        function()
          if vim.v.hlsearch == 0 then
            return ""
          end

          local ok, count = pcall(vim.fn.searchcount, { maxcount = 999, timeout = 50 })
          if not ok or count.total == 0 then
            return ""
          end

          local total = count.incomplete == 2 and (tostring(count.total) .. "+") or tostring(count.total)
          return string.format("[%d/%s]", count.current, total)
        end,
      }

      opts.sections = opts.sections or {}
      opts.sections.lualine_z = opts.sections.lualine_z or {}
      table.insert(opts.sections.lualine_z, 1, search_count)
    end,
  },
}
