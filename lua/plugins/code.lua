return {
  { "tpope/vim-repeat", keys = { { "." }, { ";" } } },
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
    opts = {
      input_buffer_type = "dressing",
    },
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
  -- harpoon (because of Prime)
  {
    "ThePrimeagen/harpoon",
    -- branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>a",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Add file to harpoon",
      },
      {
        "<leader>n",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Go to next mark : harpoon list",
      },
      {
        "<leader>p",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Go to prev mark : harpoon list",
      },
      {
        "<leader>p",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Go to prev mark : harpoon list",
      },
      {
        "<leader>1",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        desc = "Go to 1 file in harpoon list",
      },
      {
        "<leader>2",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        desc = "Go to 2 file in harpoon list",
      },
      {
        "<leader>3",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        desc = "Go to 3 file in harpoon list",
      },
      {
        "<leader>4",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        desc = "Go to 4 file in harpoon list",
      },
      {
        "<c-e>",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Toggle harpoon UI quick/menu",
      },
    },
  },
}
