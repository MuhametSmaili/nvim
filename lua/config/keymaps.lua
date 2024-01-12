-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set

-- vim.keymap.del("n", "<leader>gg")
vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>st")
-- vim.keymap.del("n", "<leader>w")

map("n", "<leader>h", ":nohl<cr>")
map("n", "<leader>w", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save buffer" })
map("n", "<C-d>", "<C-d>zz", { desc = "Move half screen down & center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Move half screen up & center" })

-- map("n", "<leader>l", "")
-- map("n", "<leader>w", "<cmd>w<esc>") -- close buffer
-- map("n", "<leader>w", "<cmd>w<esc>") -- force close buffer
-- pcmd
-- map({ "n", "v" }, "<leader>lf", function()
--   require("lazyvim.util").format({ force = true })
-- end, { desc = "Format" })
--
-- n = {
-- 	["<leader>gd"] = { gitsigns.diffthis, desc = "View git diff" },
-- 	["<leader>ga"] = { gitsigns.get_actions, desc = "Get git actions" },
-- 	["gb"] = { gitsigns.blame_line, desc = "View git blame" },
-- 	["<leader>gR"] = { gitsigns.show, desc = "View git revision" },
-- 	["<leader>gh"] = { gitsigns.preview_hunk, desc = "View git hunk per current line" },
-- 	["]h"] = { gitsigns.next_hunk, desc = "Next hunk" },
-- 	["[h"] = { gitsigns.prev_hunk, desc = "Prev hunk" },
-- 	["<leader>gr"] = { gitsigns.reset_hunk, desc = "Reset current hunk" },
-- 	["<leader>gH"] = { gitsigns.get_hunks, desc = "Get git hunks" },
-- 	["<leader>gtd"] = { gitsigns.toggle_deleted, desc = "Git toggle deleted" },
-- 	["<leader>gts"] = { gitsigns.toggle_signs, desc = "Git toggle signs" },
-- 	["<leader>gtw"] = { gitsigns.toggle_word_diff, desc = "Git toggle word diff" },
-- 	["<leader>gc"] = { ":FzfLua git_commits<cr>", desc = "View git commits for this buffer" },
-- 	["<leader>gs"] = { ":FzfLua git_status<cr>", desc = "Git status" },
-- 	["<leader>gb"] = { ":FzfLua git_bcommits<cr>", desc = "Git buffer commits" },
-- },
-- Plugins to check
-- https://github.com/Bekaboo/dropbar.nvim
-- utilyre/sentiment.nvim
