return {
  { -- Collection of various small independent plugins/modules
    "echasnovski/mini.nvim",
    config = function()

      require("mini.ai").setup({ n_lines = 500 })
      require("mini.move").setup()
      require("mini.pairs").setup()
      require("mini.git").setup()
      require("mini.diff").setup()
      require("mini.surround").setup()

    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
