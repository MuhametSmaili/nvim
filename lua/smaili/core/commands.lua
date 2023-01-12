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

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	group = smailiGroup,
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

-- Format cuurent buffer using null-ls
vim.api.nvim_create_user_command("FormatCurrentBuffer", function()
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
	})
end, {})

-- Enable code higlighting for markdown files
vim.cmd("let g:markdown_fenced_languages = ['html', 'javascript', 'typescript', 'vim', 'lua', 'css']")
