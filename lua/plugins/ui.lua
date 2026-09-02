return {
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "onedark",
					section_separators = "",
					component_separators = "",
				},
			})
		end,
	},
	{
		"catgoose/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{ "echasnovski/mini.icons", opts = {} },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup()
		end,
	},
}
