return {
	"embark-theme/vim",
	name = "embark",
	priority = 1000,
	lazy = false,
	config = function()
		-- Activate Embark colorscheme
		vim.cmd("colorscheme embark")

		-- Palette highlights matching Embark theme
		local bg_float = "#2d2b45"
		local bg_sel = "#3e3b5e"
		local fg = "#cbe3e7"
		local comment = "#8a889d"

		local err = "#f02e65"
		local warn = "#f2a174"
		local info = "#63f2f1"
		local hint = "#a682ff"

		local hl = vim.api.nvim_set_hl

		-- 1. Borderless Popup Menu (Pmenu)
		hl(0, "Pmenu", { fg = fg, bg = bg_float })
		hl(0, "PmenuSel", { fg = "NONE", bg = bg_sel, bold = true })
		hl(0, "PmenuKind", { fg = fg, bg = bg_float })
		hl(0, "PmenuExtra", { fg = comment, bg = bg_float })
		hl(0, "PmenuSbar", { bg = bg_float })
		hl(0, "PmenuThumb", { bg = bg_sel })

		-- 2. Borderless Floating Windows
		hl(0, "NormalFloat", { fg = fg, bg = bg_float })
		hl(0, "FloatBorder", { fg = bg_float, bg = bg_float })

		-- 3. Transparent CMP Item Highlights
		hl(0, "CmpItemAbbr", { fg = fg, bg = "NONE" })
		hl(0, "CmpItemAbbrDeprecated", { fg = comment, bg = "NONE", strikethrough = true })
		hl(0, "CmpItemAbbrMatch", { fg = warn, bg = "NONE", bold = true })
		hl(0, "CmpItemAbbrMatchFuzzy", { fg = warn, bg = "NONE", bold = true })
		hl(0, "CmpItemKind", { fg = info, bg = "NONE" })
		hl(0, "CmpItemMenu", { fg = comment, bg = "NONE" })

		-- 4. Borderless Notify Toast Overrides
		hl(0, "NotifyBACKGROUND", { bg = bg_float })

		hl(0, "NotifyERRORIcon", { fg = err })
		hl(0, "NotifyERRORTitle", { fg = err, bold = true })
		hl(0, "NotifyERRORBody", { fg = fg })

		hl(0, "NotifyWARNIcon", { fg = warn })
		hl(0, "NotifyWARNTitle", { fg = warn, bold = true })
		hl(0, "NotifyWARNBody", { fg = fg })

		hl(0, "NotifyINFOIcon", { fg = info })
		hl(0, "NotifyINFOTitle", { fg = info, bold = true })
		hl(0, "NotifyINFOBody", { fg = fg })

		hl(0, "NotifyDEBUGIcon", { fg = hint })
		hl(0, "NotifyDEBUGTitle", { fg = hint, bold = true })
		hl(0, "NotifyDEBUGBody", { fg = fg })

		hl(0, "NotifyTRACEIcon", { fg = hint })
		hl(0, "NotifyTRACETitle", { fg = hint, bold = true })
		hl(0, "NotifyTRACEBody", { fg = fg })
	end,
}
