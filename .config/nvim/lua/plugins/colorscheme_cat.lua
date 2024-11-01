return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = true,
	priority = 1000,
	opts = function()
		require("catppuccin").setup({
			transparent_background = true,
			flavour = "macchiato",
			integrations = {
				cmp = true,
				mason = true,
				neotree = true,
				gitsigns = true,
				treesitter = true,
			},
		})
	end,
}
