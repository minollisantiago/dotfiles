return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        layout_config = {
          height = 0.90,
          width = 0.90, -- Adjust the width here (0.75 for 75% of the screen width)
          horizontal = {
            preview_width = 0.6,
          },
        },
      })
    end,
  },
}