return {
  {
    "neovim/nvim-lspconfig",
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
      keys[#keys + 1] = { "gA", ":FzfLua lsp_code_actions<CR>" }
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