
---@module Foldtext
---more details https://www.reddit.com/r/neovim/comments/16sqyjz/finally_we_can_have_highlighted_folds/
-- and
-- https://www.reddit.com/r/neovim/comments/16xz3q9/treesitter_highlighted_folds_are_now_in_neovim/?share_id=4ifT2LZqiJ894l95r3VyC
---
-- credits to -> https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/util/ui.lua
return function()
	local ok = pcall(vim.treesitter.get_parser, vim.api.nvim_get_current_buf())
	local ret = ok and vim.treesitter.foldtext and vim.treesitter.foldtext()
	if not ret or type(ret) == "string" then
		ret = { { vim.api.nvim_buf_get_lines(0, vim.v.lnum - 1, vim.v.lnum, false)[1], {} } }
	end
	-- table.insert(ret, { " " .. require("lazyvim.config").icons.misc.dots })
	table.insert(ret, { dots = "󰇘" })

	if not vim.treesitter.foldtext then
		return table.concat(
			vim.tbl_map(function(line)
				return line[1]
			end, ret),
			" "
		)
	end
	return ret
end
