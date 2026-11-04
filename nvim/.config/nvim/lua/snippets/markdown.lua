local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function date(offset)
	return os.date("%Y-%m-%d", os.time() + offset * 24 * 60 * 60)
end

return {
	s("now", {
		f(function()
			return os.date("%H:%M")
		end),
	}),

	s("tss", {
		t("- "),
		f(function()
			return os.date("%H:%M")
		end),
		t(" "),
		i(1),
	}),

	s("today", {
		f(function()
			return "[[" .. date(0) .. "]]"
		end),
	}),

	s("tomorrow", {
		f(function()
			return "[[" .. date(1) .. "]]"
		end),
	}),

	s("yesterday", {
		f(function()
			return "[[" .. date(-1) .. "]]"
		end),
	}),
}
