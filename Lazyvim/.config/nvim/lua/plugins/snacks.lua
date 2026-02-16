return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          layout = {
            -- "sidebar" is the default preset for explorer, but we modify its settings
            layout = {
              width = 21, -- Set your desired default width here
            },
          },
        },
      },
    },
  },
}
