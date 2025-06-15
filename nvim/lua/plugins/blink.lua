return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'supermaven' },
      providers = {
        supermaven = {
          name = "supermaven",
          module = "blink.compat.source",
          score_offset = 3,
        },
      },
    },
  },
}
