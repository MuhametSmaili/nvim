return {
  {
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<leader>bd", -- TODO change this
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
    -- stylua: ignore
    { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },
  -- keymaps
  {
    "folke/which-key.nvim",
    opts = {
      window = { border = "single" },
    },
  },
  -- Zen mode
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    cmd = { "NoNeckPain" },
    keys = { { "<leader>uz", "<cmd>NoNeckPain<cr>", desc = "Toggle center-screen" } },
    opts = { window = 130 },
  },
  -- neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "float",
      },
      filesystem = {
        follow_current_file = { enabled = true },
      },
    },
    keys = {
      { "<leader>e", ":Neotree source=filesystem reveal=true position=float<cr>", desc = "Float neotree" },
    },
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
        "<c-e>",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Go to prev mark : harpoon list",
      },
    },
  },
  -- todo comments
  {
    "folke/todo-comments.nvim",
    keys = {
      { "<leader>st", false },
      { "<leader>sT", false },
    },
  },
}
