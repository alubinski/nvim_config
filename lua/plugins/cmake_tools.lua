return {
	"Civitasv/cmake-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	opts = {
		cmake_command = "cmake",
		cmake_build_directory = "build/${variant:buildType}", -- Organized builds
		cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" }, -- Crucial for clangd
		cmake_build_options = {},
		cmake_console_size = 10, -- Height of the build console
		cmake_show_console = "always", -- "always", "on_error", "never"
		cmake_dap_configuration = { -- Debugger integration
			name = "cpp",
			type = "codelldb",
			request = "launch",
			stopOnEntry = false,
			runInTerminal = true,
		},
		cmake_executor = {
			name = "quickfix", -- Sends build errors to the quickfix list
			opts = {
				show = "always",
				position = "belowright",
				size = 10,
			},
		},
		cmake_runner = {
			name = "terminal", -- Runs the compiled binary in a terminal
			opts = {
				ui = {
					n_columns = 2,
				},
			},
		},
	},
	keys = {
		{ "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake Generate" },
		{ "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
		{ "<leader>cr", "<cmd>CMakeRun<cr>", desc = "CMake Run" },
		{ "<leader>cd", "<cmd>CMakeDebug<cr>", desc = "CMake Debug" },
		{ "<leader>ct", "<cmd>CMakeSelectBuildType<cr>", desc = "Select Build Type" },
		{ "<leader>cp", "<cmd>CMakeSelectBuildTarget<cr>", desc = "Select Target" },
	},
}
