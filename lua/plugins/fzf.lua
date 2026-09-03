return {
	"ibhagwan/fzf-lua",
	config = function()
		require("fzf-lua").setup({
			winopts = {
				height = 0.50,
				width = 0.60,
				row = 0.50,
				col = 0.50,
				border = "single",
				preview = {
					hidden = "nohidden",
					border = "border",
				},
			},
		})
		-- Keymaps
		vim.keymap.set("n", "<leader><leader>", "<cmd>FzfLua files<cr>", { desc = "Find files" })
		vim.keymap.set("n", "<leader>,", "<cmd>FzfLua buffers<cr>", { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<cr>", { desc = "Live grep" })
		vim.keymap.set("n", "<leader>sg", "<cmd>FzfLua live_grep<cr>", { desc = "Grep text in project" })
	end,
}
