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
  {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    opts = {
      hide_if_all_visible = true,
      show_in_active_only = true,
      handle = {
        text = " ",
        blend = 30,
        hide_if_all_visible = true,
      },
      handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = true,
        handle = true,
        search = false,
      },
      excluded_filetypes = {
        "blink-cmp-menu",
        "cmp_docs",
        "cmp_menu",
        "DressingInput",
        "lazy",
        "mason",
        "noice",
        "prompt",
        "snacks_dashboard",
        "TelescopePrompt",
      },
    },
    config = function(_, opts)
      require("scrollbar").setup(opts)
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },
  {
    "folke/noice.nvim",
    keys = {
      { "<c-f>", false, mode = { "i", "n", "s" } },
      { "<c-b>", false, mode = { "i", "n", "s" } },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
      scroll = { enabled = false },
      indent = { animate = { enabled = false } },
      picker = {
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  ["<Esc>"] = false,
                },
              },
            },
          },
        },
      },
    },
  },
}
