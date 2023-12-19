return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = false,
      },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      keys[#keys + 1] = { "gr", ":FzfLua lsp_references<CR>" }
      keys[#keys + 1] = { "gR", vim.lsp.buf.rename }
      keys[#keys + 1] = { "gd", ":FzfLua lsp_definitions<CR>" } -- lsp_declarations  -- https://github.com/ibhagwan/fzf-lua
      keys[#keys + 1] = { "gD", vim.lsp.buf.definition } -- lsp_declarations  -- https://github.com/ibhagwan/fzf-lua
      -- keys[#keys + 1] = { "gg", vim.lsp.buf.implementation } -- lsp_declarations  -- https://github.com/ibhagwan/fzf-lua
      keys[#keys + 1] = { "gI", ":FzfLua lsp_implementations<CR>" }
      keys[#keys + 1] = { "gt", ":FzfLua lsp_typedefs<CR>" }
      keys[#keys + 1] = {
        "ga",
        function()
          require("fzf-lua").lsp_code_actions({
            winopts = {
              relative = "cursor",
              width = 0.6,
              height = 0.6,
              row = 1,
              preview = { horizontal = "up:70%" },
            },
          })
        end,
      }
      -- keys[#keys + 1] = { "<leader>li", "<cmd>FzfLua lsp_incoming_calls<CR>" }
      -- keys[#keys + 1] = { "<leader>la", vim.lsp.buf.code_action }
      -- keys[#keys + 1] = { "<leader>lr", vim.lsp.buf.rename }
      -- keys[#keys + 1] = { "<leader>ld", vim.diagnostic.open_float }
      -- keys[#keys + 1] = { "<leader>lb", "<cmd>FzfLua diagnostics_document<CR>" }
      -- keys[#keys + 1] = {
      --   "<leader>lA",
      --   function()
      --     vim.lsp.buf.code_action({
      --       context = {
      --         only = {
      --           "source",
      --         },
      --         diagnostics = {},
      --       },
      --     })
      --   end,
      -- }
      --
      -- -- disable a keymap
      keys[#keys + 1] = { "gy", false }
      -- keys[#keys + 1] = { "K", false }
      -- add a keymap
      -- keys[#keys + 1] = { "H", "<cmd>echo ''<cr>" }
    end,
  },
}

-- rename
-- format buffer
-- add lsp-saga for peak hovering
-- references via fzf
