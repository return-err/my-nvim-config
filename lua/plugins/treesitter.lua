return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- 安裝需要的 Parser 和 Query
      require("nvim-treesitter").install({
        "lua",
        "vim",
        "vimdoc",
        "python",
        "javascript",
        "typescript",
        "json",
        "markdown",
        "go",
        "gomod",
      })

      -- 啟用 Tree-sitter 語法高亮
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup(
          "vim-treesitter-start",
          { clear = true }
        ),
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
