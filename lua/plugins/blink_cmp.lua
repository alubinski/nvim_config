return {
	{
		"saghen/blink.cmp",
		version = "v0.*", -- Stable version with pre-built binaries
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				config = function()
					local ls = require("luasnip")
					ls.config.setup({ enable_autosnippets = true })
					-- Load your custom LaTeX snippets
					ls.add_snippets("tex", require("snippets.latex"))
					-- Load friendly-snippets (C++, etc)
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
			"rafamadriz/friendly-snippets",
			-- Codeium dependency removed
		},
		opts = {
			keymap = {
				preset = "none",
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = {
					function(cmp)
						if cmp.is_menu_visible() then
							return cmp.select_next()
						end
						return cmp.snippet_forward()
					end,
					"fallback",
				},
				["<S-Tab>"] = {
					function(cmp)
						if cmp.is_menu_visible() then
							return cmp.select_prev()
						end
						return cmp.snippet_backward()
					end,
					"fallback",
				},
			},
			snippets = { preset = "luasnip" },
			sources = {
				-- Removed "codeium" from the default sources list
				default = { "lsp", "path", "snippets", "buffer" },
				-- Providers table is now empty/default as codeium was the only custom one
				providers = {},
			},
			completion = {
				menu = { border = "rounded", max_height = 10 },
				documentation = { window = { border = "rounded" }, auto_show = true },
				ghost_text = { enabled = true },
			},
			signature = { enabled = true, window = { border = "rounded" } },
		},
	},
}
