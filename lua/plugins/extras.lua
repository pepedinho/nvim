return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()
			vim.keymap.set("n", "<leader>ft", "<cmd>TodoFzf<cr>")
		end,
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
			vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
			vim.keymap.set("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
		end,
	},
	{
		"saecki/crates.nvim",
		event = "BufRead Cargo.toml",
		config = function()
			require("crates").setup()
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach",
		priority = 1000,
		config = function()
			vim.api.nvim_set_hl(0, "TinyInlineError", { fg = "#FF557F", bg = "#2D1F2D" })
			vim.api.nvim_set_hl(0, "TinyInlineWarn", { fg = "#FFB86C", bg = "#2D2A20" })
			vim.api.nvim_set_hl(0, "TinyInlineInfo", { fg = "#8BE9FD", bg = "#1F2B30" })
			vim.api.nvim_set_hl(0, "TinyInlineHint", { fg = "#BD93F9", bg = "#252033" })
			vim.api.nvim_set_hl(0, "TinyInlineArrow", { fg = "#2A2A37" })
			vim.api.nvim_set_hl(0, "TinyInlineBg", { bg = "#1F1F28" })
			require("tiny-inline-diagnostic").setup({
				preset = "powerline", -- Style with pointing branch '└──'
				options = {
					show_source = true,
					use_icons_from_diagnostic = true,
					add_lines = true, -- Draws pointer branches to error column
					multilines = {
						enabled = true,
						always_show = false,
					},
					show_all_diags_on_cursorline = true,
					-- Automatically handles positioning when line exceeds window width
					softwrap = 30,
				},
				hi = {
					error = "TinyInlineError",
					warn = "TinyInlineWarn",
					info = "TinyInlineInfo",
					hint = "TinyInlineHint",
					arrow = "TinyInlineArrow",
					background = "TinyInlineBg",
					mixing_color = "Normal",
				},
			})
		end,
	},
}
