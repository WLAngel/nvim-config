-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function safe_del(mode, lhs)
  pcall(vim.keymap.del, mode, lhs)
end

-- Remove LazyVim's <leader>c* keymaps defined in lazyvim/config/keymaps.lua
safe_del({ "n", "x" }, "<leader>cf")
safe_del("n", "<leader>cd")
safe_del({ "i", "n", "s" }, "<esc>")
safe_del("n", "<leader>gg")
safe_del("n", "<leader>gG")
safe_del("n", "<leader>gL")
safe_del("n", "<leader>gb")
safe_del("n", "<leader>gf")
safe_del("n", "<leader>gl")
safe_del({ "n", "x" }, "<leader>gB")
safe_del({ "n", "x" }, "<leader>gY")
safe_del("n", "<leader>dpp")
safe_del("n", "<leader>dph")

local function toggle_diff_mode()
  if vim.wo.diff then
    vim.cmd("diffoff")
  else
    vim.cmd("diffthis")
  end
end

vim.keymap.set("n", "<leader>g", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
  vim.api.nvim_echo({ { "Copied file path", "None" } }, false, {})
end, { desc = "Copy file path to clipboard", noremap = true, silent = true, nowait = true })

vim.keymap.set("n", "<leader>d", toggle_diff_mode, { desc = "Toggle diff mode", noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<leader>r", ":bp<bar>bd#<cr>", { desc = "Delete buffer and return", noremap = true, silent = true })
vim.keymap.set("n", "<leader>a", "ggVG", { desc = "Select all", noremap = true, silent = true })

vim.keymap.set("n", "<leader>ol", "<cmd>set wrap!<cr>", { desc = "Toggle wrap", noremap = true, silent = true })
vim.keymap.set("n", "<leader>oc", "<cmd>setlocal spell! spelllang=en_us<cr>", { desc = "Toggle spell check", noremap = true, silent = true })

vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>v", '"+p`]', { desc = "Paste from clipboard", noremap = true, silent = true })
vim.keymap.set("x", "<leader>v", '"+p`]', { desc = "Paste from clipboard", noremap = true, silent = true })
vim.keymap.set("n", "p", "p`]", { noremap = true, silent = true })
vim.keymap.set("x", "p", "p`]", { noremap = true, silent = true })
vim.keymap.set("x", "y", "y`]", { noremap = true, silent = true })

if vim.fn.executable("lazygit") == 1 then
  vim.keymap.set("n", "<leader>yg", function()
    Snacks.lazygit({ cwd = LazyVim.root.git() })
  end, { desc = "Lazygit (Root Dir)", noremap = true, silent = true })
  vim.keymap.set("n", "<leader>yG", function()
    Snacks.lazygit()
  end, { desc = "Lazygit (cwd)", noremap = true, silent = true })
end

vim.keymap.set("n", "<leader>yL", function()
  Snacks.picker.git_log()
end, { desc = "Git Log (cwd)", noremap = true, silent = true })
vim.keymap.set("n", "<leader>yb", function()
  Snacks.picker.git_log_line()
end, { desc = "Git Blame Line", noremap = true, silent = true })
vim.keymap.set("n", "<leader>yf", function()
  Snacks.picker.git_log_file()
end, { desc = "Git Current File History", noremap = true, silent = true })
vim.keymap.set("n", "<leader>yl", function()
  Snacks.picker.git_log({ cwd = LazyVim.root.git() })
end, { desc = "Git Log", noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "<leader>yB", function()
  Snacks.gitbrowse()
end, { desc = "Git Browse (open)", noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "<leader>yY", function()
  Snacks.gitbrowse({ open = function(url)
    vim.fn.setreg("+", url)
  end, notify = false })
end, { desc = "Git Browse (copy)", noremap = true, silent = true })

-- Visual mode: copy selection to the active clipboard provider, then move cursor to end of selection
vim.keymap.set("x", "<leader>c", '"+y`]', { desc = "Copy to clipboard", noremap = true, silent = true, nowait = true })
