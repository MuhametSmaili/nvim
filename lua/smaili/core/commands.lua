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
    end
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd({"BufReadPost"}, {
    group = smailiGroup,
    pattern = {"*"},
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end
})
-- au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

-- Format cuurent buffer using null-ls
vim.api.nvim_create_user_command("FormatCurrentBuffer", function()
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == "null-ls"
        end
    })
end, {})
