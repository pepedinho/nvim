return {
	{
		"karb94/neoscroll.nvim",
		config = function()
			local neoscroll = require("neoscroll")

			neoscroll.setup({
				mappings = {},
			})

			vim.keymap.set({ "n", "v", "x" }, "<S-Up>", function()
				neoscroll.scroll(-0.5, { move_cursor = true, duration = 250 })
			end, { desc = "Scroll up" })

			vim.keymap.set({ "n", "v", "x" }, "<S-Down>", function()
				neoscroll.scroll(0.5, { move_cursor = true, duration = 250 })
			end, { desc = "Scroll down" })
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
	{
		"rcarriga/nvim-notify",
		opts = {
			stages = "slide",
			timeout = 3000,
			render = "wrapped-compact", -- Borderless layout for compact toasts
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.45)
			end,
		},
		config = function(_, opts)
			local notify = require("notify")
			notify.setup(opts)
			vim.notify = notify
		end,
	},
}
