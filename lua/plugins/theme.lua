return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("kanagawa").setup({
			compile = false, -- enable compiling the colorscheme
			undercurl = true, -- enable undercurls
			commentStyle = { italic = true },
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			transparent = false, -- set background transparency
			dimInactive = false, -- dim inactive window
			terminalColors = true, -- define terminal colors
			theme = "wave", -- default theme ("wave", "dragon", "lotus")
			background = {
				dark = "wave", -- default dark theme ("wave" or "dragon")
				light = "lotus",
			},
		})

		-- Load the colorscheme
		vim.cmd("colorscheme kanagawa")
	end,
}
