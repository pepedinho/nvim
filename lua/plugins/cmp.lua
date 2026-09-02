return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
	},
	config = function()
		local cmp = require("cmp")

		-- Direct Nerd Font icons mapping for code completion
		local kind_icons = {
			Text = "󰉿",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰜢",
			Variable = "󰀫",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "󰑭",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "󰈇",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "󰙅",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰅲",
		}

		-- Shared borderless window configuration
		local borderless_window = {
			border = "none",
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
			col_offset = 0,
			side_padding = 1,
			scrollbar = false,
		}

		-- Code completion setup
		cmp.setup({
			window = {
				completion = borderless_window,
				documentation = borderless_window,
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local icon = kind_icons[vim_item.kind] or ""
					vim_item.kind = string.format("%s %s", icon, vim_item.kind)
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						buffer = "[Buf]",
						path = "[Path]",
					})[entry.source.name]
					return vim_item
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-e>"] = cmp.mapping.abort(),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})

		-- Search completion ('/' and '?')
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			window = { completion = borderless_window },
			sources = { { name = "buffer" } },
		})

		-- Command completion (':')
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			window = { completion = borderless_window },
			formatting = {
				fields = { "abbr" },
				format = function(_, vim_item)
					return vim_item
				end,
			},
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}
