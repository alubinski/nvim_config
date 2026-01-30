local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local rep = require("luasnip.extras").rep

-- Helper for the "mk" snippet logic (auto-spacing)
local function get_visual(args, parent)
	if #parent.snippet.env.SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
	else
		return sn(nil, i(1))
	end
end

return {
	-- Inline Math
	s({ trig = "mk", name = "Math", dscr = "Inline Math", wordTrig = true }, {
		t("$"),
		i(1),
		t("$"),
		i(0),
	}),

	-- Display Math
	s({ trig = "dm", name = "Display Math" }, {
		t({ "\\[", "\t" }),
		i(1),
		t({ "", ".\\] " }),
		i(0),
	}),

	-- Fractions (The // trigger)
	s({ trig = "//", name = "Fraction", wordTrig = false }, {
		t("\\frac{"),
		i(1),
		t("}{"),
		i(2),
		t("}"),
		i(0),
	}),

	-- Subscripts (a_12 -> a_{12} logic)
	s({ trig = "([A-Za-z])(%d%d)", regTrig = true, name = "Auto Subscript 2" }, {
		f(function(_, snip)
			return snip.captures[1] .. "_{" .. snip.captures[2] .. "}"
		end),
		i(0),
	}),

	-- Beamer Frame
	s({ trig = "frame", name = "Frame" }, {
		t("\\begin{frame}["),
		i(1, "t"),
		t("]"),
		t({ "", "\t\\frametitle{" }),
		i(2, "title"),
		t("}"),
		t({ "", "\t\\framesubtitle{" }),
		i(3, "subtitle"),
		t("}"),
		t({ "", "\t" }),
		i(0),
		t({ "", "\\end{frame}" }),
	}),

	-- Symbols
	s({ trig = "and", name = "wedge" }, { t("\\wedge ") }),
	s({ trig = "or", name = "vee" }, { t("\\vee ") }),
	s({ trig = "exists", name = "exists" }, { t("\\exists ") }),
	s({ trig = "forall", name = "forall" }, { t("\\forall ") }),

	-- Today's Date
	s({ trig = "today", name = "Date" }, {
		f(function()
			return os.date("%F")
		end),
	}),

	-- Visual Box (Replaces the Python length calculation)
	s({ trig = "box", name = "Box" }, {
		f(function(args)
			local row = "┌" .. string.rep("─", string.len(args[1][1]) + 2) .. "┐"
			return row
		end, { 1 }),
		t({ "", "│ " }),
		i(1),
		t(" │"),
		f(function(args)
			local row = "└" .. string.rep("─", string.len(args[1][1]) + 2) .. "┘"
			return { "", row }
		end, { 1 }),
		i(0),
	}),
}
