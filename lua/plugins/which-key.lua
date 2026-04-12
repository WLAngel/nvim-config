return {
  -- Disable inlay hints by default (toggle with <leader>uh)
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
    },
  },

  -- Remove <leader>c group label from which-key
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.spec = vim.tbl_filter(function(item)
        return not (type(item) == "table" and vim.tbl_contains({ "<leader>c", "<leader>d", "<leader>f", "<leader>g", "<leader>q", "<leader>w" }, item[1]))
      end, opts.spec or {})
      return opts
    end,
  },

  -- Disable LazyVim's <leader>q* session keymaps
  {
    "folke/persistence.nvim",
    keys = {
      { "<leader>qs", false },
      { "<leader>qS", false },
      { "<leader>ql", false },
      { "<leader>qd", false },
    },
  },

  -- Remove <leader>c* keys from LSP, and add custom LSP keymaps
  {
    "neovim/nvim-lspconfig",
    keys = {
      { "<leader>cl", false },
      { "<leader>ca", false, mode = { "n", "x" } },
      { "<leader>cc", false, mode = { "n", "x" } },
      { "<leader>cC", false },
      { "<leader>cR", false },
      { "<leader>cr", false },
      { "<leader>cA", false },
      { "<leader>co", false },
      { "gs", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", desc = "Go to definition (vertical split)" },
    },
  },

  -- Remove <leader>cF from conform (formatting)
  {
    "stevearc/conform.nvim",
    keys = {
      { "<leader>cF", false, mode = { "n", "x" } },
    },
  },

  -- Remove <leader>cm from mason
  {
    "mason-org/mason.nvim",
    keys = {
      { "<leader>cm", false },
    },
  },

  -- Remove <leader>cs / <leader>cS from trouble
  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>cs", false },
      { "<leader>cS", false },
    },
  },
}
