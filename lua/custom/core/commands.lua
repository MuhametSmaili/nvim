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

--
-- clear neocodeium result when cmp is open

vim.api.nvim_create_autocmd("User", {
	pattern = "BlinkCmpMenuOpen",
	group = smailiGroup,
	callback = function()
		local has_neocodeium, neocodeium = pcall(require, "neocodeium")

		if has_neocodeium then
			neocodeium.clear()
		end
	end,
})

-- Set colorscehme
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("colorscheme " .. Custom.get_colorscheme("catppuccin"))
	end,
})
