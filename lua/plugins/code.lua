return {
  { "tpope/vim-repeat", keys = { { "." }, { ";" } } },
  {
    "kylechui/nvim-surround",
    version = "*",
    keys = { { "ys" }, { "S", mode = "v" }, { "cs" }, { "ds" } },
    opts = {},
  },

  -- opposite and increment/decrement
  {
    "nat-418/boole.nvim",
    keys = { { "<C-a>" }, { "<C-x>" } },
    opts = {
      mappings = {
        increment = "<C-a>",
        decrement = "<C-x>",
      },
    },
  },
  -- Smart Comments
  -- {
  --   "numToStr/comment.nvim",
  --   dependencies = {
  --     "JoosepAlviste/nvim-ts-context-commentstring",
  --   },
  --   keys = { { "gc" }, { "gc", mode = "v" } },
  --   opts = {
  --     pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  --   },
  -- },

  -- split join
  {
    "Wansmer/treesj",
    dependencies = "nvim-treesitter",
    keys = {
      { "<leader>cj", "<cmd>TSJToggle<cr>", desc = "Join/split code block" },
    },
    opts = { use_default_keymaps = false },
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
  -- {
  --   "smjonas/inc-rename.nvim",
  --   cmd = "IncRename",
  --   config = true,
  --   opts = {
  --     input_buffer_type = "dressing",
  --   },
  -- },
  -- big files
  {
    "LunarVim/bigfile.nvim",
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
  },
  {
    "cbochs/grapple.nvim",
    opts = {
      scope = "git_branch",
      -- style = "basename",
    },
    lazy = true,
    cmd = "Grapple",
    dependencies = {
      -- {
      --   "cbochs/portal.nvim",
      --   keys = {
      --     { "<leader>sjb", "<cmd>Portal jumplist backward<cr>", desc = "Jump backward" },
      --     { "<leader>sjf", "<cmd>Portal jumplist forward<cr>", desc = "Jump forward" },
      --     {
      --       "<leader>p",
      --       function()
      --         require("portal.builtin").grapple.tunnel()
      --       end,
      --       desc = "Jump on grapple",
      --     },
      --   },
      -- },
    },
    keys = {
      {
        "<leader>a",
        function()
          require("grapple").toggle()
        end,
        desc = "Add file to grapple",
      },
      -- {
      --   "<c-j>",
      --   "<cmd>Grapple cycle forward<cr>",
      --   desc = "Grapple cycle forward",
      -- },
      -- {
      --   "<c-k>",
      --   "<cmd>Grapple cycle backward<cr>",
      --   desc = "Grapple cycle backward",
      -- },
      {
        "<leader>1",
        "<cmd>Grapple select index=1<cr>",
        desc = "Go to 1 file in grapple list",
      },
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
        "<leader>m",
        function()
          require("grapple").open_tags()
        end,
        desc = "Toggle grapple UI quick/menu",
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
  {
    "andrewferrier/debugprint.nvim",
    opts = {},
    -- keys = {
    --   { "g?v", mode = { "n", "x" }, desc = "Veriable log" },
    --   { "g?V", mode = { "n", "x" }, desc = "Veriable log above" },
    --   { "g?p", mode = { "n", "x" }, desc = "Plain debug log below" },
    --   { "g?P", mode = { "n", "x" }, desc = "Plain debug log below" },
    -- },
    dependencies = {
      -- "echasnovski/mini.nvim", -- Needed to enable :ToggleCommentDebugPrints for NeoVim <= 0.9
      -- "nvim-treesitter/nvim-treesitter", -- Needed to enable treesitter for NeoVim 0.8
    },
    -- Remove the following line to use development versions,
    -- not just the formal releases
    version = "*",
  },
}
