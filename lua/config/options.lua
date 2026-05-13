-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- tmux.conf must set:
--   set -g set-clipboard on
--   set-option -g update-environment "SSH_CLIENT SSH_CONNECTION SSH_TTY"
-- so that SSH vars survive re-attach. We also query tmux showenv directly
-- because existing panes inherit env at creation time, not on re-attach.
local function tmux_has_ssh()
  if vim.env.TMUX == nil then return false end
  local out = vim.fn.system("tmux showenv SSH_CLIENT 2>/dev/null")
  return out:match("^SSH_CLIENT=") ~= nil
end

local is_ssh = vim.env.SSH_CLIENT ~= nil
  or vim.env.SSH_CONNECTION ~= nil
  or vim.env.SSH_TTY ~= nil
  or tmux_has_ssh()

if is_ssh then
  local osc52 = require("vim.ui.clipboard.osc52")

  vim.g.clipboard = {
    name = "osc52",
    copy = {
      ["+"] = osc52.copy("+"),
      ["*"] = osc52.copy("*"),
    },
    paste = {
      ["+"] = osc52.paste("+"),
      ["*"] = osc52.paste("*"),
    },
  }
end

-- Disable auto-format on save globally (use <leader>i to format manually)
vim.g.autoformat = false

-- Use unnamed register (") only, not system clipboard
vim.opt.clipboard = ""

-- Hide Neovim's inline search count; we show it in lualine instead.
vim.opt.shortmess:append("S")

-- Disable mouse completely
vim.opt.mouse = ""

vim.opt.listchars = {
  tab = "▷⋅",
  trail = "·",
}
