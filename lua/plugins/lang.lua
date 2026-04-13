return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      -- Go / TypeScript / PHP language behavior is configured via LazyVim extras in config/lazy.lua.
      -- Keep this file focused on shared parsers we want preinstalled globally.
      local add = {
        "bash",
        "css",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      }

      for _, parser in ipairs(add) do
        if not vim.tbl_contains(opts.ensure_installed, parser) then
          table.insert(opts.ensure_installed, parser)
        end
      end
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      -- Leave language-specific tools to their LazyVim extras and keep only generic tools here.
      local add = {
        "lua-language-server",
        "shfmt",
        "stylua",
        "vtsls",
      }

      for _, pkg in ipairs(add) do
        if not vim.tbl_contains(opts.ensure_installed, pkg) then
          table.insert(opts.ensure_installed, pkg)
        end
      end
    end,
  },
}
