-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set

map("n", "<leader>h", ":nohl<cr>")
map("n", "<leader>w", "<cmd>w<cr>") -- save buffer
-- map("n", "<leader>l", "")
-- map("n", "<leader>w", "<cmd>w<esc>") -- close buffer
-- map("n", "<leader>w", "<cmd>w<esc>") -- force close buffer
-- pcmd
-- map({ "n", "v" }, "<leader>lf", function()
--   require("lazyvim.util").format({ force = true })
-- end, { desc = "Format" })
