Custom.explorer.preferred_layout = function()
	return "vertical"
end

Custom.explorer.set_next_preferred_layout = function(picker)
	local layouts = require("snacks.picker.config.layouts")

	layouts.vertical = vim.tbl_deep_extend("keep", { layout = { auto_hide = { "preview" } } }, layouts.vertical)
	layouts.ivy_wider_preview = vim.tbl_deep_extend("keep", { layout = { height = 0.95 } }, layouts.ivy)
	layouts.ivy_wider_preview.layout[2][2].width = 0.8

	local idx = 1
	local preferred = {
		"vertical",
		"ivy_wider_preview",
	}
	idx = idx % #preferred + 1
	picker:set_layout(preferred[idx])
end

function Custom.explorer.make_copy_action(reg)
	return function(_, item)
		local fn = vim.fn
		local modify = fn.fnamemodify

		local filepath = item.file
		local filename = modify(filepath, ":t")

		local results = {
			modify(filepath, ":p"), -- absolute
			modify(filepath, ":."),
			modify(filepath, ":~"),
			filename,
		}

		local labels = {
			"Absolute path",
			"Path relative to CWD",
			"Path relative to HOME",
			"Filename",
		}

		if fn.isdirectory(filepath) == 0 then
			table.insert(results, modify(filename, ":r"))
			table.insert(results, modify(filename, ":e"))
			table.insert(labels, "Filename without extension")
			table.insert(labels, "Extension of the filename")
		end

		local items = {}
		for i, label in ipairs(labels) do
			table.insert(items, label .. ": " .. results[i])
		end

		vim.ui.select(items, { prompt = "Choose to copy to clipboard:" }, function(_, idx)
			if not idx then
				vim.notify("Selection cancelled")
				return
			end
			local result = results[idx]
			fn.setreg(reg, result)
			vim.notify("Copied: " .. result)
		end)
	end
end

function Custom.explorer.explorer_copy_default(picker, item)
	if not item then
		return
	end
	local Tree = require("snacks.explorer.tree")
	local actions = require("snacks.explorer.actions")
	local uv = vim.uv or vim.loop
	---@type string[]
	local paths = vim.tbl_map(Snacks.picker.util.path, picker:selected())
	-- Copy selection
	if #paths > 0 then
		local dir = picker:dir()
		Snacks.picker.util.copy(paths, dir)
		picker.list:set_selected() -- clear selection
		Tree:refresh(dir)
		Tree:open(dir)
		actions.update(picker, { target = dir })
		return
	end
	Snacks.input({
		prompt = "Copy to",
		default = vim.fn.fnamemodify(item.file, ":t"),
	}, function(value)
		if not value or value:find("^%s$") then
			return
		end
		local dir = vim.fs.dirname(item.file)
		local to = svim.fs.normalize(dir .. "/" .. value)
		if uv.fs_stat(to) then
			Snacks.notify.warn("File already exists:\n- `" .. to .. "`")
			return
		end
		Snacks.picker.util.copy_path(item.file, to)
		Tree:refresh(vim.fs.dirname(to))
		actions.update(picker, { target = to })
	end)
end
