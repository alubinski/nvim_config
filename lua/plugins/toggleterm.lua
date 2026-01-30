return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		size = 20,
		open_mapping = [[<c-\>]], -- Primary toggle shortcut
		hide_numbers = true,
		shade_terminals = true,
		start_in_insert = true,
		insert_mappings = true,
		terminal_mappings = true,
		persist_size = true,
		direction = "horizontal", -- "horizontal", "vertical", "float"
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "curved",
			winblend = 3,
		},
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		-- Terminal-specific keybinds for easier navigation
		function _G.set_terminal_keymaps()
			local t_opts = { buffer = 0 }
			-- Easy exit from terminal mode back to normal mode
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], t_opts)
			-- Window navigation from within terminal
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], t_opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], t_opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], t_opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], t_opts)
		end

		-- Run this only when a terminal is open
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		-- Custom Terminal: BTM/HTOP (Great for monitoring C++ performance)
		local Terminal = require("toggleterm.terminal").Terminal
		local htop = Terminal:new({ cmd = "htop", hidden = true, direction = "float" })

		vim.keymap.set("n", "<leader>th", function()
			htop:toggle()
		end, { desc = "Toggle Htop" })
	end,
}
