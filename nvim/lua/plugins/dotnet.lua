return {
	{
		"GustavEikaas/easy-dotnet.nvim",
		ft = { "cs", "fsproj", "csproj" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("easy-dotnet").setup({
				terminal = function(path, action)
					local commands = {
						run = function()
							return "dotnet run --project " .. path
						end,
						test = function()
							return "dotnet test " .. path
						end,
						restore = function()
							return "dotnet restore " .. path
						end,
						build = function()
							return "dotnet build " .. path
						end,
					}
					local command = commands[action]() .. "\r"
					vim.cmd("vsplit")
					vim.cmd("term " .. command)
				end,
			})

			-- Keymaps
			vim.keymap.set("n", "<leader>dr", function()
				require("easy-dotnet").run()
			end, { desc = "Dotnet: Run" })

			vim.keymap.set("n", "<leader>dt", function()
				require("easy-dotnet").test()
			end, { desc = "Dotnet: Test" })

			vim.keymap.set("n", "<leader>db", function()
				require("easy-dotnet").build()
			end, { desc = "Dotnet: Build" })

			vim.keymap.set("n", "<leader>ds", function()
				require("easy-dotnet").restore()
			end, { desc = "Dotnet: Restore" })

			vim.keymap.set("n", "<leader>dp", function()
				require("easy-dotnet").picker()
			end, { desc = "Dotnet: Project Picker" })
		end,
	},
}
