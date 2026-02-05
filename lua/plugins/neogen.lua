return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		require("neogen").setup({
			enabled = true,
			-- Choose the convention you want
			languages = {
				cpp = {
					template = {
						annotation_convention = "doxygen", -- Best for C++
					},
				},
				java = {
					template = {
						annotation_convention = "javadoc", -- Best for Java
					},
				},
			},
		})
	end,
	keys = {
		{
			"<leader>nf",
			function()
				require("neogen").generate()
			end,
			desc = "Generate Annotation (Function/Class)",
		},
	},
}
