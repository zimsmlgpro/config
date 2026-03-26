return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local install_dir = vim.fn.stdpath("data") .. "/site"

      -- Manually add to runtimepath since nvim-treesitter isn't doing it
      vim.opt.rtp:prepend(install_dir)

      require("nvim-treesitter").setup({
        install_dir = install_dir,
      })

      -- Install all our parsers
      require("nvim-treesitter").install({
        "c_sharp",
        "javascript",
        "typescript",
        "python",
        "sql",
        "cpp",
        "lua",
        "vim",
        "vimdoc",
        "json",
        "yaml",
        "toml",
        "markdown",
        "markdown_inline",
        "bash",
        "regex",
        "nu",
        "xml",
      })

      -- Disable highlight for files over 5MB
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          local buf = ev.buf
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > 5 * 1024 * 1024 then
            return
          end
          pcall(vim.treesitter.start, buf)
        end,
      })
    end,
  },
}
