return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "" },
					topdelete = { text = "" },
					changedelete = { text = "▎" },
					untracked = { text = "▎" },
				},
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns
					local opts = { buffer = bufnr }

					-- Navigation
					vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next git hunk" })
					vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Previous git hunk" })

					-- Actions
					vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Git: Stage hunk" })
					vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Git: Reset hunk" })
					vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { desc = "Git: Stage buffer" })
					vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { desc = "Git: Reset buffer" })
					vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Git: Undo stage hunk" })
					vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Git: Preview hunk" })
					vim.keymap.set("n", "<leader>hb", function()
						gs.blame_line({ full = true })
					end, { desc = "Git: Blame line" })
					vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = "Git: Diff this" })

					-- Toggles
					vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Git: Toggle line blame" })
					vim.keymap.set("n", "<leader>td", gs.toggle_deleted, { desc = "Git: Toggle deleted" })
				end,
			})
		end,
	},
}
