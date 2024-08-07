return {
  {
    "echasnovski/mini.ai",
    version = false,
    opts = {
      n_lines = 500,
    },
  },
  {
    "echasnovski/mini.move",
    version = false,
    opts = {},
  },
  {
    "echasnovski/mini.diff",
    version = false,
    opts = {},
  },
  {
    "echasnovski/mini.surround",
    version = false,
    opts = {},
  },
  {
    "echasnovski/mini.completion",
    version = false,
    opts = {
      delay = {
        completion = 10^7,
        info = 10^7,
        signature = 100,
      },
      window = {
        signature = {
          height = 50,
          width = 120,
          border = "rounded",
        }
      }
    },
  },
  -- { -- Collection of various small independent plugins/modules
  --   "echasnovski/mini.nvim",
  --   config = function()
  --
  --     require("mini.ai").setup({ n_lines = 500 })
  --     require("mini.move").setup()
  --     require("mini.git").setup()
  --     require("mini.diff").setup()
  --     require("mini.surround").setup()
  --
  --   end,
  -- },
}
-- vim: ts=2 sts=2 sw=2 et
