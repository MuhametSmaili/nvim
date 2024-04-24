return {
  {
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<leader>bd", -- TODO: change this
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
      {
        "<leader>bD",
        function()
          require("mini.bufremove").delete(0, true)
        end,
        desc = "Delete Buffer (Force)",
      },
    },
  },
  {
    "zeioth/garbage-day.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- keymaps
  {
    "folke/which-key.nvim",
    opts = {
      window = { border = "single" },
    },
  },

  -- Center buffer
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    cmd = { "NoNeckPain" },
    keys = { { "<leader>uz", "<cmd>NoNeckPain<cr>", desc = "Toggle center-screen" } },
    opts = { width = 120 },
  },
  -- Dressing ui
  -- {
  --   "stevearc/dressing.nvim",
  --   opts = {
  --     input = {
  --       override = function(opt)
  --         if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
  --           opt.anchor = "SW"
  --           opt.col = 1
  --           opt.row = vim.o.lines - vim.o.cmdheight - 1
  --           opt.relative = "editor"
  --         end
  --       end,
  --     },
  --   },
  -- },
  -- neotree
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   opts = {
  --     window = {
  --       position = "float",
  --     },
  --     filesystem = {
  --       follow_current_file = { enabled = true },
  --     },
  --   },
  --   keys = {
  --     { "<leader>e", ":Neotree source=filesystem reveal=true position=float<cr>", desc = "Float neotree" },
  --   },
  -- },
}
