return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("kanagawa").setup({
			theme = "wave",
			overrides = function(colors)
				local theme = colors.theme
				return {
					-- Uniform popup menu background (eliminates padding color contrast)
					Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
					PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2, bold = true },
					PmenuKind = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
					PmenuExtra = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
					PmenuSbar = { bg = theme.ui.bg_p1 },
					PmenuThumb = { bg = theme.ui.bg_p1 },
					NormalFloat = { fg = theme.ui.fg, bg = theme.ui.bg_p1 },
					FloatBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },

					-- Force CMP item highlights to have transparent background to inherit Pmenu cleanly
					CmpItemAbbr = { fg = theme.ui.fg, bg = "NONE" },
					CmpItemAbbrDeprecated = { fg = theme.syn.comment, bg = "NONE", strikethrough = true },
					CmpItemAbbrMatch = { fg = theme.diag.warning, bg = "NONE", bold = true },
					CmpItemAbbrMatchFuzzy = { fg = theme.diag.warning, bg = "NONE", bold = true },
					CmpItemKind = { fg = theme.syn.fun, bg = "NONE" },
					CmpItemMenu = { fg = theme.syn.comment, bg = "NONE" },
				}
			end,
		})
		vim.cmd("colorscheme kanagawa")
	end,
}
