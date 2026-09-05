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
		local types = require("cmp.types")
		local lsp_kind = types.lsp.CompletionItemKind

		-- Custom comparator to prioritize variables, fields, and properties
		local prefer_variables = function(entry1, entry2)
			local kind1 = entry1:get_kind()
			local kind2 = entry2:get_kind()

			local is_var1 = (kind1 == lsp_kind.Variable or kind1 == lsp_kind.Field or kind1 == lsp_kind.Property)
			local is_var2 = (kind2 == lsp_kind.Variable or kind2 == lsp_kind.Field or kind2 == lsp_kind.Property)

			if is_var1 and not is_var2 then
				return true
			elseif not is_var1 and is_var2 then
				return false
			end
			return nil
		end

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
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
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
			matching = {
				disallow_fuzzy_matching = false,
				disallow_fullfuzzy_matching = false,
				disallow_partial_fuzzy_matching = false,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-e>"] = cmp.mapping.abort(),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "luasnip", priority = 750 },
			}, {
				-- Secondary group: lower priority and require at least 3 chars for buffer words
				{
					name = "buffer",
					priority = 250,
					keyword_length = 3,
					option = {
						get_bufnrs = function()
							return { vim.api.nvim_get_current_buf() }
						end,
					},
				},
				{ name = "path", priority = 250 },
			}),

			sorting = {
				priority_weight = 2,
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					prefer_variables, -- Prioritizes variables, fields, and properties above other kinds
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
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
