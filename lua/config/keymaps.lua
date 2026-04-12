-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remove LazyVim's <leader>c* keymaps defined in lazyvim/config/keymaps.lua
vim.keymap.del({ "n", "x" }, "<leader>cf")
vim.keymap.del("n", "<leader>cd")
vim.keymap.del({ "i", "n", "s" }, "<esc>")

-- Visual mode: copy selection to the active clipboard provider, then move cursor to end of selection
vim.keymap.set("v", "<leader>c", '"+y`]', { desc = "Copy to clipboard", noremap = true, silent = true })
