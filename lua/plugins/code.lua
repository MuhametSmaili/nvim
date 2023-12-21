return {
  -- {
  --   "tpope/vim-surround",
  --   keys = { { "ys" }, { "S", mode = "v" }, { "cs" }, { "ds" } },
  --   dependencies = {
  --     "tpope/vim-repeat",
  --   },
  -- },
  {
    "kylechui/nvim-surround",
    version = "*",
    keys = { { "ys" }, { "S", mode = "v" }, { "cs" }, { "ds" } },
    opts = {},
  },

  -- Smart Comments
  {
    "numToStr/comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    keys = { { "gc" }, { "gc", mode = "v" } },
    opts = {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    },
  },

  -- vim-system-copy
  {
    "christoomey/vim-system-copy",
    keys = {
      { "cp", desc = "Copy to system clipboard(motion)" },
      { "cv", desc = "Paste from system clipboard(motion)" },
    },
  },

  -- UndotreeToggle
  {
    "mbbill/undotree",
    keys = {
      { "<leader>gu", "<cmd>UndotreeToggle<CR>", desc = "Toggle undotree" },
    },
  },

  -- Generate documentation
  {
    "danymat/neogen",
    config = true,
    keys = {
      {
        "<leader>cn",
        function()
          require("neogen").generate({})
        end,
        desc = "Generate func|class|type documentation",
      },
    },
  },

  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- Refactoring tool
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor({})
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  },
}
