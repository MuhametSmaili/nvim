-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- took from: https://gist.github.com/MyyPo/569de2bff5644d2c351d54a0d42ad09f
local yank_group = vim.api.nvim_create_augroup("highlight_yank", { clear = true })

-- Set cursor position before yanking
vim.api.nvim_create_autocmd("ModeChanged", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.g.pre_yank_cursor_pos = vim.fn.getcurpos()
  end,
})

---@param reg Register
local function shift_reg(reg)
  ---@class Register
  ---@field val string
  ---@field typ string

  for i = 8, 1, -1 do
    vim.fn.setreg(i + 1, vim.fn.getreg(i), vim.fn.getregtype(i))
  end

  vim.fn.setreg("1", reg.val, reg.typ)
end

vim.g.lat_small_reg = vim.fn.getreg("-")
vim.api.nvim_create_autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    if vim.v.event.operator == "y" then
      -- Highlight the yanked area
      -- vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })

      -- Come back to the set yank position
      vim.fn.setpos(".", vim.g.pre_yank_cursor_pos)

      -- Save yanks in the numbered registers
      shift_reg({ val = vim.fn.getreg("0"), typ = vim.fn.getregtype("0") })

      return
    end

    -- Ignore regular deletes
    if vim.v.event.regtype ~= "v" then
      return
    end

    -- Save small deletes in numbered registers
    local small = vim.fn.getreg("-")
    if small ~= vim.g.lat_small_reg then
      shift_reg({ val = small, typ = vim.fn.getregtype("-") })
      vim.g.lat_small_reg = small
    end
  end,
})

-- Save system clipboard in numbered registers
vim.g.lat_sys_reg = vim.fn.getreg("+")
vim.api.nvim_create_autocmd("FocusGained", {
  group = yank_group,
  pattern = "*",
  callback = function()
    local sys_val = vim.fn.getreg("+")
    if sys_val ~= vim.g.lat_sys_reg and sys_val ~= vim.fn.getreg("1") then
      shift_reg({ val = sys_val, typ = vim.fn.getregtype("+") })
      vim.g.lat_sys_reg = sys_val
    end
  end,
})
