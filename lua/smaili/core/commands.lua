local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local smailiGroup = augroup("smaili", {})
local HiglightOnYankGroup = augroup("HiglightOnYank", {})

-- Highlight on yank
autocmd("TextYankPost", {
	group = HiglightOnYankGroup,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })

-- Return to last edit position when opening files
-- vim.api.nvim_create_autocmd({ "BufReadPost" }, {
-- 	group = smailiGroup,
-- 	pattern = { "*" },
-- 	callback = function()
-- 		vim.api.nvim_exec('silent! normal! g`"zv', false)
-- 	end,
-- })

-- vim.api.nvim_create_autocmd("BufReadPost", {
-- 	group = smailiGroup,
-- 	callback = function()
-- 		local mark = vim.api.nvim_buf_get_mark(0, '"')
-- 		local lcount = vim.api.nvim_buf_line_count(0)
-- 		if mark[1] > 0 and mark[1] <= lcount then
-- 			pcall(vim.api.nvim_win_set_cursor, 0, mark)
-- 		end
-- 	end,
-- })
--
autocmd("BufReadPost", {
	callback = function()
		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
			vim.cmd('normal! g`"')
		end
	end,
	group = smailiGroup,
	desc = "Go To The Last Cursor Position",
})

-- Format current buffer using null-ls
vim.api.nvim_create_user_command("FormatCurrentBuffer", function()
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		timeout_ms = 2000,
	})
end, {})

-- Enable code higlighting for markdown files
vim.cmd("let g:markdown_fenced_languages = ['html', 'javascript', 'typescript', 'vim', 'lua', 'css']")
