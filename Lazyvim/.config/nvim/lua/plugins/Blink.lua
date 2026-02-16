return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          border = "rounded",
          scrollbar = false, -- Disables the scrollbar to fix the border overlap
        },
        documentation = {
          window = {
            border = "rounded",
            scrollbar = false, -- Disables scrollbar in docs
          },
        },
      },
      signature = {
        window = {
          border = "rounded",
          scrollbar = false, -- Disables scrollbar in signature help
        },
      },
    },
  },
}
