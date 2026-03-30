return {
  "pevin/pastel-dawn",
  lazy = false,
  priority = 1001,
  config = function()
    require("pastel-dawn").setup({
      -- your options here
    })
    vim.cmd.colorscheme("pastel-dawn")
  end,
}
