return {
  "pevin/pastel-dawn",
  dir = vim.fn.expand("~/projects/pastel-dawn"),  -- load from local for development; remove to use GitHub
  lazy = false,
  priority = 1001,
  config = function()
    require("pastel-dawn").setup({
      -- your options here
    })
    vim.cmd.colorscheme("pastel-dawn")
  end,
}
