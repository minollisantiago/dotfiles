return {
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"tailwindcss-language-server",
				"typescript-language-server",
				"yaml-language-server",
				"css-lsp",
				"html-lsp",
				"pyright",
				"htmlhint",
				"json-lsp",
				"marksman",
				"markdownlint",
				"markdown-toc",
				"markdownlint-cli2",
				"stylua",
				"taplo",
				"sqlfluff",
			})
		end,
	},
}
