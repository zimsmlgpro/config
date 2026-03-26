return {
    {
        "folke/snacks.nvim",
        priority = 1000, 
        lazy = false, 
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            dashboard = {
                enabled = true, 
                sections = {
                    { section = "header" },
                    { section = "keys", gap =1, padding = 1 },
                    { section = "recent_files", indent = 2, padding = 1 },
                    { section = "startup" },
                },
            },
            explorer = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            notifier = {
                enabled = true,
                timeout = 3000,
            },
            picker = { enabled = true },
            quickfile = { enabled = true }, 
            scope = { enabled = true }, 
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
        keys = {
            { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
            { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
            { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
            { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
            { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
            { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
            { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
            -- LSP pickers
            { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
            { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
            -- Git
            { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
            { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
            { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
            -- Notifications
            { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
            -- Misc
            { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
            { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    },
  },
}
