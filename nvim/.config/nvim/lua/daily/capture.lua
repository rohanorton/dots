local M = {}

function M.new_entry()
	return "- " .. os.date("%H:%M") .. ": "
end

function M.insert_entry(after_line)
	local entry = M.new_entry()
	local new_line = after_line + 1

	vim.api.nvim_buf_set_lines(0, after_line, after_line, false, { entry })
	vim.api.nvim_win_set_cursor(0, { new_line, #entry - 1 })
	vim.cmd.startinsert({ bang = true })
end

local function heading_pattern(name)
	return "^##%s+" .. vim.pesc(name) .. "%s*$"
end

local function is_heading(line)
	return line:match("^##%s+") ~= nil
end

function M.current_section()
	local line = vim.fn.line(".")

	while line > 0 do
		local text = vim.fn.getline(line)
		local heading = text:match("^##%s+(.+)$")

		if heading then
			return heading
		end

		line = line - 1
	end

	return nil
end

local function section_insert_after_line(name)
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local start_line = nil

	for i, line in ipairs(lines) do
		if line:match(heading_pattern(name)) then
			start_line = i
			break
		end
	end

	if not start_line then
		return nil
	end

	local next_heading = start_line + 1

	while next_heading <= #lines and not is_heading(lines[next_heading]) do
		next_heading = next_heading + 1
	end

	local last_content = next_heading - 1

	while last_content > start_line and lines[last_content]:match("^%s*$") do
		last_content = last_content - 1
	end

	return last_content
end

local function insert_bullet(after_line)
	local entry = "- "
	local new_line = after_line + 1

	vim.api.nvim_buf_set_lines(0, after_line, after_line, false, { entry })
	vim.api.nvim_win_set_cursor(0, { new_line, #entry - 1 })
	vim.cmd.startinsert({ bang = true })
end

function M.capture_in(name)
	local line = section_insert_after_line(name)

	if not line then
		vim.notify("Section not found: " .. name, vim.log.levels.WARN)
		return
	end

	if name == "Log" then
		M.insert_entry(line)
		return
	end

	insert_bullet(line)
end

return M
