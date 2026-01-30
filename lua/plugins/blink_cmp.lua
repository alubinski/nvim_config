return {
	"saghen/blink.cmp",
	version = "v1.*",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			config = function()
				local ls = require("luasnip")
				-- Enable auto-triggering snippets
				ls.config.setup({ enable_autosnippets = true })

				-- Load your custom LaTeX snippets
				ls.add_snippets("tex", require("snippets.latex"))

				-- Also load friendly-snippets
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		"rafamadriz/friendly-snippets",
	},
	opts = {
		-- ... keep your existing opts from the previous message ...
		snippets = { preset = "luasnip" },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
}
