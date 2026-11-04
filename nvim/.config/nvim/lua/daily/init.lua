local detect = require("daily.detect")
local capture = require("daily.capture")

local M = {}

function M.attach(args)
	local buf = args.buf

	if not detect.is_daily_note(buf) then
		return
	end

	vim.keymap.set("n", "<leader>l", function()
		capture.capture_in("Log")
	end, { buffer = buf, desc = "Daily: capture in Log" })

	vim.keymap.set("n", "<leader>i", function()
		capture.capture_in("Inbox")
	end, { buffer = buf, desc = "Daily: capture in Inbox" })

	vim.keymap.set("n", "<leader>k", function()
		capture.capture_in("Links")
	end, { buffer = buf, desc = "Daily: capture in Links" })
end

return M
