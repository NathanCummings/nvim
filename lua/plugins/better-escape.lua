return {
  "max397574/better-escape.nvim",
  lazy = false,
  config = function()
    require("better_escape").setup({ mapping = { "jk", "jj", "kj", "kk"} }
    )
  end,
}