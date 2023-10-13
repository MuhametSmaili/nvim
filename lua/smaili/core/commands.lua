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

-- Go the last cursor position on buffer
autocmd("BufReadPost", {
	callback = function()
		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
			vim.cmd('normal! g`"')
		end
	end,
	group = smailiGroup,
	desc = "Go To The Last Cursor Position",
})

-- -- Format current buffer using null-ls
-- vim.api.nvim_create_user_command("FormatCurrentBuffer", function()
-- 	vim.lsp.buf.format({
-- 		async = true,
-- 		filter = function(client)
-- 			return client.name == "null-ls"
-- 		end,
-- 		timeout_ms = 2000,
-- 	})
-- end, {})

-- Enable code higlighting for markdown files
vim.cmd("let g:markdown_fenced_languages = ['html', 'javascript', 'typescript', 'vim', 'lua', 'css']")
