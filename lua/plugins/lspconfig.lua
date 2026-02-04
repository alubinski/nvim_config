local config = function()
	local on_attach = function(client, bufnr)
		local keyset = vim.keymap.set
		keyset("n", "<leader>rn", vim.lsp.buf.rename, {}) -- rename
		keyset("n", "<leader>ca", vim.lsp.buf.code_action, {}) -- code action

		keyset("n", "gd", vim.lsp.buf.definition, {}) -- global definition
		keyset("n", "gi", vim.lsp.buf.implementation, {}) -- global implementation
		keyset("n", "gr", require("telescope.builtin").lsp_references, {}) -- global references
		keyset("n", "K", vim.lsp.buf.hover, {}) -- global implementation
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end
	end

	local capabilities = require("blink.cmp").get_lsp_capabilities()

	-- Setup all of the LSPs
	require("lspconfig").lua_ls.setup({ on_attach = on_attach, capabilities = capabilities })
	require("lspconfig").rust_analyzer.setup({ on_attach = on_attach, capabilities = capabilities })
	require("lspconfig").clangd.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = {
			"clangd",
			"--header-insertion=never", -- Optional: prevents annoying auto-includes
			"--background-index",
			"--clang-tidy",
		},
		init_options = { fallbackFlags = { "-std=c++20" }, compilationDatabasePath = "build" },
		settings = {
			clangd = {
				InlayHints = {
					Designators = true,
					Enabled = true,
					ParameterNames = true,
					DeducedTypes = true, -- This is the one for 'auto'
				},
			},
		},
	})
	require("lspconfig").texlab.setup({ on_attach = on_attach, capabilities = capabilities })
	require("lspconfig").marksman.setup({ on_attach = on_attach, capabilities = capabilities })
	require("lspconfig").jedi_language_server.setup({ on_attach = on_attach, capabilities = capabilities })
	require("lspconfig").html.setup({ on_attach = on_attach, capabilities = capabilities })
	require("lspconfig").cssls.setup({ on_attach = on_attach, capabilities = capabilities })
	require("lspconfig").ts_ls.setup({ on_attach = on_attach, capabilities = capabilities })
	require("lspconfig").bashls.setup({ on_attach = on_attach, capabilities = capabilities })
	require("lspconfig").hls.setup({ on_attach = on_attach, capabilities = capabilities })
	require("lspconfig").tailwindcss.setup({ on_attach = on_attach, capabilities = capabilities })
	require("lspconfig").asm_lsp.setup({ on_attach = on_attach, capabilities = capabilities })
end

return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = config,
}
