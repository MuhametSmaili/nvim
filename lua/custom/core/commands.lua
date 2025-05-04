local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local smailiGroup = augroup("smaili", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
	group = smailiGroup,
	desc = "Highlight text on yank",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Go to the last cursor position when reopening buffer
autocmd("BufReadPost", {
	group = smailiGroup,
	desc = "Restore last cursor position",
	callback = function()
		vim.defer_fn(function()
			if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
				vim.cmd('normal! g`"')
			end
		end, 0)
	end,
})

-- Enable fenced code highlighting for markdown
vim.g.markdown_fenced_languages = { "html", "javascript", "typescript", "vim", "lua", "css" }

-- Clear NeoCodeium suggestions when CMP menu opens
autocmd("User", {
	group = smailiGroup,
	pattern = "BlinkCmpMenuOpen",
	desc = "Clear NeoCodeium when CMP menu opens",
	callback = function()
		local ok, neocodeium = pcall(require, "neocodeium")
		if ok then
			neocodeium.clear()
		end
	end,
})

-- Set colorscheme on startup
autocmd("VimEnter", {
	group = smailiGroup,
	desc = "Set custom colorscheme",
	callback = function()
		vim.cmd("colorscheme " .. Custom.get_colorscheme("catppuccin"))
	end,
})

-- Disable auto-commenting on newline
autocmd("FileType", {
	pattern = "*",
	group = smailiGroup,
	desc = "Disable auto comment on new lines",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})
