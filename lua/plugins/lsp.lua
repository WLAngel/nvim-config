return {
  -- Disable inlay hints by default (toggle with <leader>oi)
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
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

  -- Move Sidekick CLI keymaps from <leader>a* to <leader>k* (<leader>a = select all)
  {
    "folke/sidekick.nvim",
    keys = {
      { "<leader>a",  false, mode = { "n", "v" } },
      { "<leader>aa", false },
      { "<leader>as", false },
      { "<leader>ad", false },
      { "<leader>at", false, mode = { "x", "n" } },
      { "<leader>af", false },
      { "<leader>av", false, mode = "x" },
      { "<leader>ap", false, mode = { "n", "x" } },
      { "<leader>k",  "", desc = "+sidekick", mode = { "n", "v" } },
      {
        "<leader>ka",
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>ks",
        function() require("sidekick.cli").select() end,
        desc = "Select CLI",
      },
      {
        "<leader>kd",
        function() require("sidekick.cli").close() end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>kt",
        function() require("sidekick.cli").send({ msg = "{this}" }) end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>kf",
        function() require("sidekick.cli").send({ msg = "{file}" }) end,
        desc = "Send File",
      },
      {
        "<leader>kv",
        function() require("sidekick.cli").send({ msg = "{selection}" }) end,
        mode = "x",
        desc = "Send Visual Selection",
      },
      {
        "<leader>kp",
        function() require("sidekick.cli").prompt() end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
    },
  },

  -- Move CopilotChat keymaps from <leader>a* to <leader>q* (<leader>a = select all)
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    keys = {
      { "<leader>a",  false, mode = { "n", "x" } },
      { "<leader>aa", false, mode = { "n", "x" } },
      { "<leader>ax", false, mode = { "n", "x" } },
      { "<leader>aq", false, mode = { "n", "x" } },
      { "<leader>ap", false, mode = { "n", "x" } },
      { "<leader>q",  "", desc = "+ai", mode = { "n", "x" } },
      {
        "<leader>qa",
        function() require("CopilotChat").toggle() end,
        desc = "Toggle (CopilotChat)",
        mode = { "n", "x" },
      },
      {
        "<leader>qx",
        function() require("CopilotChat").reset() end,
        desc = "Clear (CopilotChat)",
        mode = { "n", "x" },
      },
      {
        "<leader>qq",
        function()
          vim.ui.input({ prompt = "Quick Chat: " }, function(input)
            if input ~= "" then require("CopilotChat").ask(input) end
          end)
        end,
        desc = "Quick Chat (CopilotChat)",
        mode = { "n", "x" },
      },
      {
        "<leader>qp",
        function() require("CopilotChat").select_prompt() end,
        desc = "Prompt Actions (CopilotChat)",
        mode = { "n", "x" },
      },
    },
  },
}
