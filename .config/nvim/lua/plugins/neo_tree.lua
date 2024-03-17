return {
  "nvim-neo-tree/neo-tree.nvim",
  name = "neotree",
  lazy = true,
  keys = {
    {
      "<C-e>",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          source = "filesystem",
          position = "right",
        })
      end,
      desc = "Filesystem (root dir)",
    },
  },
}
