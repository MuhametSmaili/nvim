vim.opt.conceallevel = 2
vim.keymap.set(
  "n",
  "<leader>oa",
  ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>",
  { desc = "Apply 'note' template to this buffer" }
)

vim.keymap.set("n", "<leader>ot", ":ObsidianTemplate<cr>", { desc = "Find obsidian templates " })
