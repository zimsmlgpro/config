return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          python = { "black" },
          cpp = { "clang_format" },
          cs = { "csharpier" },
          sql = { "sqlfmt" },
          lua = { "stylua" },
          svelte = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
        },
        -- Format on save
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })

      -- Manual format keymap
      vim.keymap.set({ "n", "v" }, "<leader>cf", function()
        require("conform").format({
          async = true,
          lsp_fallback = true,
        })
      end, { desc = "Format file" })
    end,
  },
}
