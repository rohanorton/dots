local M = {}

local function normalize(path)
	return vim.fs.normalize(path)
end

function M.is_daily_note(buf)
	local notebook = vim.env.ZK_NOTEBOOK_DIR

	if not notebook then
		return false
	end

	local path = normalize(vim.api.nvim_buf_get_name(buf))
	local daily = normalize(notebook .. "/daily/")

	return vim.startswith(path, daily)
end

return M
