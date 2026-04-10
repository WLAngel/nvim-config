return {
  -- Remove flash operator-pending mode so ys/ds/cs (nvim-surround) work correctly
  {
    "folke/flash.nvim",
    keys = {
      { "s", mode = { "n", "x" } },  -- keep normal + visual, drop operator-pending
      { "S", mode = { "n", "x" } },
      { "r", false, mode = "o" },     -- disable remote flash (operator-pending)
      { "R", false, mode = { "o", "x" } },
      { "<c-s>", mode = { "c" } },
    },
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
    keys = {
      -- remap visual surround: S -> gS to avoid flash conflict
      { "gS", "<Plug>(nvim-surround-visual)", mode = "x", desc = "Add surround (visual)" },
      { "S", false, mode = "x" },
    },
  },
}
