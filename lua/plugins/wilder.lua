return {
	"gelguy/wilder.nvim",
	keys = { ":", "/", "?" },
	config = function()
		local wilder = require("wilder")
		wilder.setup({ modes = { ":", "/", "?" } })

		-- Disable default keybindings if needed, or keep standard behavior
		wilder.set_option("pipeline", {
			wilder.branch(
				wilder.cmdline_pipeline({
					fuzzy = 1,
				}),
				wilder.vim_search_pipeline()
			),
		})

		-- Configure popup appearance to match Kanagawa seamlessly
		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
				border = "solid", -- Options: "single", "rounded", "solid"
				highlights = {
					border = "FloatBorder", -- Uses Kanagawa float border color
					default = "Pmenu", -- Uses Kanagawa popup menu background
				},
				highlighter = wilder.basic_highlighter(),
				reverse = 0, -- Menu expands UPWARDS above the bottom cmdline
				left = { " ", wilder.popupmenu_devicons() },
				right = { " ", wilder.popupmenu_scrollbar() },
			}))
		)
	end,
}
