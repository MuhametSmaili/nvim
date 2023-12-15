return {
  {
    "tpope/vim-surround",
    keys = { { "ys" }, { "S", mode = "v" }, { "cs" }, { "ds" } },
    dependencies = {
      "tpope/vim-repeat",
    },
  },
  {
    "christoomey/vim-system-copy",
    keys = {
      { "cp", desc = "Copy to system clipboard(motion)" },
      { "cv", desc = "Paste from system clipboard(motion)" },
    },
  },
  {
    "mbbill/undotree",
    keys = {
      { "<leader>gu", "<cmd>UndotreeToggle<CR>", desc = "Toggle undotree" },
    },
  },
}
