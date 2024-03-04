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

  -- split join
  {
    "Wansmer/treesj",
    dependencies = "nvim-treesitter",
    keys = {
      { "<leader>cj", "<cmd>TSJToggle<cr>", desc = "Join/split code block" },
    },
    opts = { use_default_keymaps = false },
  },

  -- vim-system-copy
  -- {
  --   "christoomey/vim-system-copy",
  --   keys = {
  --     { "cp", desc = "Copy to system clipboard(motion)" },
  --     { "cv", desc = "Paste from system clipboard(motion)" },
  --   },
  -- },

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
  -- {
  --   "smjonas/inc-rename.nvim",
  --   cmd = "IncRename",
  --   config = true,
  --   opts = {
  --     input_buffer_type = "dressing",
  --   },
  -- },

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
  {
    "cbochs/grapple.nvim",
    dependencies = {
      {
        "cbochs/portal.nvim",
        keys = {
          { "<leader>o", "<cmd>Portal jumplist backward<cr>", desc = "Jump backward" },
          { "<leader>i", "<cmd>Portal jumplist forward<cr>", desc = "Jump forward" },
          {
            "<leader>j",
            function()
              require("portal.builtin").grapple.tunnel()
            end,
            desc = "Jump on grapple",
          },
        },
      },
    },
    keys = {
      {
        "<leader>a",
        function()
          require("grapple").toggle()
        end,
        desc = "Add file to harpoon",
      },
      -- {
      --   "<leader>n",
      --   function()
      --     require("harpoon.ui").nav_next()
      --   end,
      --   desc = "Go to next mark : harpoon list",
      -- },
      -- {
      --   "<leader>p",
      --   function()
      --     require("harpoon.ui").nav_prev()
      --   end,
      --   desc = "Go to prev mark : harpoon list",
      -- },
      -- {
      --   "<leader>p",
      --   function()
      --     require("harpoon.ui").nav_prev()
      --   end,
      --   desc = "Go to prev mark : harpoon list",
      -- },
      {
        "<leader>1",
        "<cmd>Grapple select index=1<cr>",
        desc = "Go to 1 file in grapple list",
      },
      {
        "<leader>2",
        "<cmd>Grapple select index=2<cr>",
        desc = "Go to 2 file in grapple list",
      },
      {
        "<leader>3",
        "<cmd>Grapple select index=3<cr>",
        desc = "Go to 3 file in grapple list",
      },
      {
        "<leader>4",
        "<cmd>Grapple select index=4<cr>",
        desc = "Go to 4 file in grapple list",
      },
      {
        "<c-e>",
        function()
          require("grapple").open_tags()
        end,
        desc = "Toggle grapple UI quick/menu",
      },
    },
  },
  -- harpoon (because of Prime)
  -- {
  --   -- cbochs/grapple.nvim
  --   "ThePrimeagen/harpoon",
  --   -- branch = "harpoon2",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   keys = {
  --     {
  --       "<leader>a",
  --       function()
  --         require("harpoon.mark").add_file()
  --       end,
  --       desc = "Add file to harpoon",
  --     },
  --     {
  --       "<leader>n",
  --       function()
  --         require("harpoon.ui").nav_next()
  --       end,
  --       desc = "Go to next mark : harpoon list",
  --     },
  --     {
  --       "<leader>p",
  --       function()
  --         require("harpoon.ui").nav_prev()
  --       end,
  --       desc = "Go to prev mark : harpoon list",
  --     },
  --     {
  --       "<leader>p",
  --       function()
  --         require("harpoon.ui").nav_prev()
  --       end,
  --       desc = "Go to prev mark : harpoon list",
  --     },
  --     {
  --       "<leader>1",
  --       function()
  --         require("harpoon.ui").nav_file(1)
  --       end,
  --       desc = "Go to 1 file in harpoon list",
  --     },
  --     {
  --       "<leader>2",
  --       function()
  --         require("harpoon.ui").nav_file(2)
  --       end,
  --       desc = "Go to 2 file in harpoon list",
  --     },
  --     {
  --       "<leader>3",
  --       function()
  --         require("harpoon.ui").nav_file(3)
  --       end,
  --       desc = "Go to 3 file in harpoon list",
  --     },
  --     {
  --       "<leader>4",
  --       function()
  --         require("harpoon.ui").nav_file(4)
  --       end,
  --       desc = "Go to 4 file in harpoon list",
  --     },
  --     {
  --       "<c-e>",
  --       function()
  --         require("harpoon.ui").toggle_quick_menu()
  --       end,
  --       desc = "Toggle harpoon UI quick/menu",
  --     },
  --   },
  -- },
}
