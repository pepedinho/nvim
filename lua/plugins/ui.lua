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
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				cmdline = {
					view = "cmdline_popup",
				},
				popupmenu = {
					-- Force Noice to use cmp for the backend
					backend = "cmp",
				},
				views = {
					cmdline_popup = {
						position = {
							row = "40%",
							col = "50%",
						},
						size = {
							width = 60,
							height = "auto",
						},
						border = {
							style = "single",
							padding = { 0, 1 },
						},
						win_options = {
							-- Force border and background colors to match the theme
							winhighlight = "NormalFloat:Normal,FloatBorder:FloatBorder",
						},
					},
					popupmenu = {
						relative = "editor",
						position = {
							row = "44%",
							col = "50%",
						},
						size = {
							width = 60,
							height = 10,
						},
						border = {
							style = "single",
							padding = { 0, 1 },
						},
						win_options = {
							-- Ensure consistent colors and a distinct selection color
							winhighlight = "NormalFloat:Normal,FloatBorder:FloatBorder,CursorLine:Visual",
						},
					},
				},
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
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
