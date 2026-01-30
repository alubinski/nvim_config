return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Manual format trigger
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		-- Define your formatters by filetype
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run the first available formatter in the list
			python = { "isort", "black" },
			-- C++ setup
			cpp = { "clang-format" },
			c = { "clang-format" },
			-- Use a sub-list to run only the first available formatter
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},

		-- Set up format-on-save
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},

		-- Individual formatter settings
		formatters = {
			["clang-format"] = {
				-- Use a local .clang-format file if it exists, else fallback to LLVM style
				prepend_args = { "-style=file", "--fallback-style=LLVM" },
			},
		},
	},
}
