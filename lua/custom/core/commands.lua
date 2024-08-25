local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local smailiGroup = augroup("smaili", { clear = true })
local HiglightOnYankGroup = augroup("HiglightOnYank", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
	group = HiglightOnYankGroup,
	pattern = "*",
	desc = "Highlight text when yank",
	callback = function()
		vim.highlight.on_yank()
	end,
})

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

-- Enable code higlighting for markdown files
vim.cmd("let g:markdown_fenced_languages = ['html', 'javascript', 'typescript', 'vim', 'lua', 'css']")
