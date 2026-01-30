return {
	"stevearc/overseer.nvim",
	cmd = {
		"OverseerOpen",
		"OverseerClose",
		"OverseerToggle",
		"OverseerRun",
		"OverseerBuild",
	},
	opts = {
		-- Default strategy is terminal, but we can integrate with ToggleTerm
		strategy = {
			"toggleterm",
			direction = "horizontal",
			quit_on_exit = "success",
		},
		templates = { "builtin" },
		-- Appearance of the task list
		task_list = {
			direction = "right",
			bindings = {
				["<C-l>"] = false,
				["<C-h>"] = false,
				["q"] = "Close",
				["<CR>"] = "RunAction",
				["p"] = "TogglePreview",
			},
		},
	},
	keys = {
		{ "<leader>oo", "<cmd>OverseerToggle<cr>", desc = "Overseer List" },
		{ "<leader>or", "<cmd>OverseerRun<cr>", desc = "Overseer Run Task" },
		{ "<leader>oc", "<cmd>OverseerBuild<cr>", desc = "Overseer Build" },
		{ "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Overseer Info" },
	},
}
