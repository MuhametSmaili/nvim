-------------------------------------------------
-- name : fzf-lua
-- url  : https://github.com/ibhagwan/fzf-lua
---------------------------------------------------
return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  keys = {
    { "<C-p>", ":FzfLua files<cr>", desc = "Find files" },
    { "<leader>sw", ":lua require'fzf-lua'.live_grep({ multiprocess=true })<CR>", desc = "Find word (live_grep)" },
    {
      "<leader>sW",
      ":lua require'fzf-lua'.grep_project({ multiprocess=true })<CR>",
      desc = "Find word (grep project)",
    },
    { "<leader><tab>", ":FzfLua buffers<cr>", desc = "Find buffers" },
    { "<leader>sr", ":FzfLua registers <cr>", desc = "Search registers" },
    { "<leader>sc", ":FzfLua colorschemes<cr>", desc = "Search colorschemes" },
    { "<leader>sh", ":FzfLua help_tags<cr>", desc = "Search help tags" },
    { "<leader>sH", ":FzfLua highlights<cr>", desc = "Search highlights" },
    { "<leader>sm", ":FzfLua marks <cr>", desc = "Search marks" },
    { "<leader>sM", ":FzfLua man_pages <cr>", desc = "Search manual pages" },
    { "<leader>sk", ":FzfLua keymaps <cr>", desc = "Search key mappings" },
    { "<leader>ss", ":FzfLua spell_suggest <cr>", desc = "Show spell suggestions" },
    { "<leader>sj", ":FzfLua jumps <cr>", desc = "Search jumps" },
    { "<leader>gb", ":FzfLua git_bcommits<cr>", desc = "Git buffer commits" },
    {
      "<leader>st",
      "<cmd>lua require('fzf-lua').grep({search='TODO|HACK|PERF|NOTE|FIX', no_esc=true})<CR>",
      desc = "Search tags TODO|FIX|PERF|FIX...",
    },
    { "gr", ":FzfLua lsp_references<CR>", desc = "Go to refrences" },
  },
  opts = {
    "default",
    -- previewers = {
    --   git_diff = {
    --     pager = "delta --width=$FZF_PREVIEW_COLUMNS",
    --   },
    -- },
    -- git = {
    -- bcommits = {
    --   preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS",
    -- },
    -- },
    winopts = {
      on_create = function()
        vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<Down>", { silent = true, noremap = true })
        vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", "<Up>", { silent = true, noremap = true })
      end,
      winopts = {
        relativenumber = true,
      },
    },
    keymap = {
      -- builtin = {
      -- 	["<F1>"] = "toggle-help",
      -- 	["<F2>"] = "toggle-fullscreen",
      -- 	-- Only valid with the 'builtin' previewer
      -- 	["<F3>"] = "toggle-preview-wrap",
      -- 	["<F4>"] = "toggle-preview",
      -- 	-- Rotate preview clockwise/counter-clockwise
      -- 	["<F5>"] = "toggle-preview-ccw",
      -- 	["<F6>"] = "toggle-preview-cw",
      ["<C-d>"] = "preview-page-down",
      ["<C-u>"] = "preview-page-up",
      -- 	["<S-left>"] = "preview-page-reset",
      -- },
      fzf = {
        -- fzf '--bind=' options
        -- ["ctrl-z"] = "abort",
        -- ["ctrl-u"] = "unix-line-discard",
        -- ["ctrl-f"] = "half-page-down",
        -- ["ctrl-b"] = "half-page-up",
        -- ["ctrl-a"] = "beginning-of-line",
        -- ["ctrl-e"] = "end-of-line",
        -- ["alt-a"] = "toggle-all",
        -- Only valid with fzf previewers (bat/cat/git/etc)
        -- ["f3"] = "toggle-preview-wrap",
        -- ["f4"] = "toggle-preview",
        -- ["<C-d>"] = "preview-page-down",
        -- ["<C-u>"] = "preview-page-up",
        ["ctrl-d"] = "preview-page-down",
        ["ctrl-u"] = "preview-page-up",
      },
    },
    lsp = {
      -- code_actions = {
      --   previewer = "codeaction_native",
      --   preview_pager = "delta --side-by-side --width=$FZF_PREVIEW_COLUMNS --hunk-header-style='omit' --file-style='omit'",
      --   layout = "flex",
      -- },
    },
  },
}
