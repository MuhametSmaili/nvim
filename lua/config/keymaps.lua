-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set

vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>st")
vim.keymap.del("n", "<leader>w-")
vim.keymap.del("n", "<leader>w|")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>ww")

map("n", "<leader>h", ":nohl<cr>")
map("n", "<leader>w", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save buffer" })
-- map("n", "<C-d>", "<C-d>zz", { desc = "Move half screen down & center" })
-- map("n", "<C-u>", "<C-u>zz", { desc = "Move half screen up & center" })
map(
  "n",
  "<leader>st",
  "<cmd>lua require('fzf-lua').grep({search='TODO|HACK|PERF|NOTE|FIX', no_esc=true})<CR>",
  { desc = "Search tags TODO|FIX|PERF|FIX..." }
)

-- map copy to system keyboard cp -> \"y+
map("v", "cp", '"+y')
map("n", "cp$", 'v$"+y')
map("n", "cP", '0v$"+y')
map("n", "cpaw", 'vaw"+y')
map("n", "cpiw", 'viw"+y')
map("n", "cpj", '0vj$"+y')
map("n", "cpk", '0vk$"+y')
map("n", "cpw", 'viw"+y')
map("n", "cpa{", 'va{"+y')
map("n", "cpi{", 'vi{"+y')
map("n", "cpa}", 'va}"+y')
map("n", "cpi}", 'vi}"+y')
map("n", "cpa(", 'va("+y')
map("n", "cpi(", 'vi("+y')
map("n", "cpa)", 'va)"+y')
map("n", "cpi)", 'vi)"+y')
map("n", "cpi[", 'vi["+y')
map("n", "cpa[", 'va["+y')
map("n", "cpi]", 'vi]"+y')
map("n", "cpa]", 'va]"+y')
map("n", 'cpa"', 'va""+y')
map("n", 'cpi"', 'vi""+y')
map("n", "cpa'", "va'\"+y")
map("n", "cpi'", "vi'\"+y")

-- map("n", "<D-j>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
-- map("n", "<D-k>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })
-- map("n", "<D-j>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
-- map("n", "<D-k>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })

-- map copy to system keyboard cp -> \"y+
map("v", "cp", '"+y')
map("n", "cp$", 'v$"+y')
map("n", "cP", '0v$"+y')
map("n", "cpaw", 'vaw"+y')
map("n", "cpiw", 'viw"+y')
map("n", "cpj", '0vj$"+y')
map("n", "cpk", '0vk$"+y')
map("n", "cpw", 'viw"+y')
map("n", "cpa{", 'va{"+y')
map("n", "cpi{", 'vi{"+y')
map("n", "cpa}", 'va}"+y')
map("n", "cpi}", 'vi}"+y')
map("n", "cpa(", 'va("+y')
map("n", "cpi(", 'vi("+y')
map("n", "cpa)", 'va)"+y')
map("n", "cpi)", 'vi)"+y')
map("n", "cpi[", 'vi["+y')
map("n", "cpa[", 'va["+y')
map("n", "cpi]", 'vi]"+y')
map("n", "cpa]", 'va]"+y')
map("n", 'cpa"', 'va""+y')
map("n", 'cpi"', 'vi""+y')
map("n", "cpa'", "va'\"+y")
map("n", "cpi'", "vi'\"+y")
map("n", "cpG", 'vG"+y')
map("n", "cpgg", 'vgg"+y')
