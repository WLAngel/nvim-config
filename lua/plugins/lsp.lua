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
      { "gi", vim.lsp.buf.implementation, desc = "Go to Implementation" },
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

  -- Move refactoring keymaps from <leader>r* to <leader>m* (<leader>r = delete buffer and return)
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      { "<leader>r", false, mode = { "n", "x" } },
      { "<leader>rs", false, mode = { "n", "x" } },
      { "<leader>ri", false, mode = { "n", "x" } },
      { "<leader>rb", false, mode = { "n", "x" } },
      { "<leader>rf", false, mode = { "n", "x" } },
      { "<leader>rF", false, mode = { "n", "x" } },
      { "<leader>rx", false, mode = { "n", "x" } },
      { "<leader>rp", false, mode = { "n", "x" } },
      { "<leader>rP", false },
      { "<leader>rc", false },
      { "<leader>m", "", desc = "+refactor", mode = { "n", "x" } },
      {
        "<leader>ms",
        function()
          require("refactoring").select_refactor()
        end,
        mode = { "n", "x" },
        desc = "Refactor",
      },
      {
        "<leader>mx",
        function()
          return require("refactoring").refactor("Extract Variable")
        end,
        mode = { "n", "x" },
        expr = true,
        desc = "Extract Variable",
      },
      {
        "<leader>mf",
        function()
          return require("refactoring").refactor("Extract Function")
        end,
        mode = { "n", "x" },
        expr = true,
        desc = "Extract Function",
      },
      {
        "<leader>mF",
        function()
          return require("refactoring").refactor("Extract Function To File")
        end,
        mode = { "n", "x" },
        expr = true,
        desc = "Extract Function To File",
      },
      {
        "<leader>mb",
        function()
          return require("refactoring").refactor("Extract Block")
        end,
        mode = { "n", "x" },
        expr = true,
        desc = "Extract Block",
      },
      {
        "<leader>mi",
        function()
          return require("refactoring").refactor("Inline Variable")
        end,
        mode = { "n", "x" },
        expr = true,
        desc = "Inline Variable",
      },
      {
        "<leader>mp",
        function()
          require("refactoring").debug.print_var({ normal = true })
        end,
        mode = { "n", "x" },
        desc = "Debug Print Variable",
      },
      {
        "<leader>mP",
        function()
          require("refactoring").debug.printf({ below = false })
        end,
        desc = "Debug Print",
      },
      {
        "<leader>mc",
        function()
          require("refactoring").debug.cleanup({})
        end,
        desc = "Debug Cleanup",
      },
    },
  },

  -- Move Sidekick CLI keymaps from <leader>a* to <leader>k* (<leader>a = select all)
  {
    "folke/sidekick.nvim",
    keys = {
      { "<c-.>", false, mode = { "n", "t", "i", "x" } },
      { "<leader>a", false, mode = { "n", "v" } },
      { "<leader>aa", false },
      { "<leader>as", false },
      { "<leader>ad", false },
      { "<leader>at", false, mode = { "x", "n" } },
      { "<leader>af", false },
      { "<leader>av", false, mode = "x" },
      { "<leader>ap", false, mode = { "n", "x" } },
      { "<leader>k", "", desc = "+sidekick", mode = { "n", "v" } },
      {
        "<leader>kk",
        function()
          require("sidekick.cli").focus()
        end,
        desc = "Sidekick Focus CLI",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<leader>ka",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>ks",
        function()
          require("sidekick.cli").select()
        end,
        desc = "Select CLI",
      },
      {
        "<leader>kd",
        function()
          require("sidekick.cli").close()
        end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>kt",
        function()
          require("sidekick.cli").send({ msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>kf",
        function()
          require("sidekick.cli").send({ msg = "{file}" })
        end,
        desc = "Send File",
      },
      {
        "<leader>kv",
        function()
          require("sidekick.cli").send({ msg = "{selection}" })
        end,
        mode = "x",
        desc = "Send Visual Selection",
      },
      {
        "<leader>kp",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
    },
  },

  -- Move CopilotChat keymaps from <leader>a* to <leader>q* (<leader>a = select all)
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    keys = {
      { "<leader>a", false, mode = { "n", "x" } },
      { "<leader>aa", false, mode = { "n", "x" } },
      { "<leader>ax", false, mode = { "n", "x" } },
      { "<leader>aq", false, mode = { "n", "x" } },
      { "<leader>ap", false, mode = { "n", "x" } },
      { "<leader>q", "", desc = "+ai", mode = { "n", "x" } },
      {
        "<leader>qa",
        function()
          require("CopilotChat").toggle()
        end,
        desc = "Toggle (CopilotChat)",
        mode = { "n", "x" },
      },
      {
        "<leader>qx",
        function()
          require("CopilotChat").reset()
        end,
        desc = "Clear (CopilotChat)",
        mode = { "n", "x" },
      },
      {
        "<leader>qq",
        function()
          vim.ui.input({ prompt = "Quick Chat: " }, function(input)
            if input ~= "" then
              require("CopilotChat").ask(input)
            end
          end)
        end,
        desc = "Quick Chat (CopilotChat)",
        mode = { "n", "x" },
      },
      {
        "<leader>qp",
        function()
          require("CopilotChat").select_prompt()
        end,
        desc = "Prompt Actions (CopilotChat)",
        mode = { "n", "x" },
      },
    },
  },
}
