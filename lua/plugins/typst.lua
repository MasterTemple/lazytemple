return {
  {
    "chomosuke/typst-preview.nvim",
    -- version = "87db18b",
    ft = "typst",
    opts = function(_, opts)
      if vim.g.personal then
        opts.open_cmd = "uwsm app -- brave --new-window --ozone-platform=wayland --app=%s"
      end
    end,
  },
}
