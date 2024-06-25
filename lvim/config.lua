-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
    },
    config = function()
      require("telescope").load_extension("undo")
      vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
    end,
  },
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
      "nvim-tree/nvim-web-devicons" -- Recommended but not required. Icons in discussion tree.
    },
    enabled = true,
    build = function () require("gitlab.server").build(true) end, -- Builds the Go binary
    config = function()
      local gitlab = require("gitlab")
      gitlab.setup()
      vim.keymap.set("n", "gir", gitlab.review, {desc = "review"})
      vim.keymap.set("n", "gis", gitlab.summary, {desc = "summary"})
      vim.keymap.set("n", "giA", gitlab.approve, {desc = "approve"})
      vim.keymap.set("n", "giR", gitlab.revoke, {desc = "revoke"})
      vim.keymap.set("n", "gic", gitlab.create_comment, {desc = "commet"})
      vim.keymap.set("v", "gic", gitlab.create_multiline_comment, {desc = "multilie comment"})
      vim.keymap.set("v", "giC", gitlab.create_comment_suggestion, {desc = "suggest comment"})
      vim.keymap.set("n", "giO", gitlab.create_mr, {desc = "create mr"})
      vim.keymap.set("n", "gim", gitlab.move_to_discussion_tree_from_diagnostic, {desc = "discussion tree"})
      vim.keymap.set("n", "gin", gitlab.create_note, {desc = "note"})
      vim.keymap.set("n", "gid", gitlab.toggle_discussions, {desc = "toggle discussion"})
      vim.keymap.set("n", "giaa", gitlab.add_assignee, {desc = "add"})
      vim.keymap.set("n", "giad", gitlab.delete_assignee, {desc = "delete assignee"})
      vim.keymap.set("n", "gila", gitlab.add_label, {desc = "add label"})
      vim.keymap.set("n", "gild", gitlab.delete_label, {desc = "delete label"})
      vim.keymap.set("n", "giva", gitlab.add_reviewer, {desc = "add reviewer"})
      vim.keymap.set("n", "givd", gitlab.delete_reviewer, {desc = "delete reviewer"})
      vim.keymap.set("n", "gip", gitlab.pipeline, {desc = "pipeline"})
      vim.keymap.set("n", "gio", gitlab.open_in_browser, {desc = "browser"})
      vim.keymap.set("n", "giM", gitlab.merge, {desc = "MERGE"})
      lvim.builtin.which_key.mappings["gi"] = {
        name = "gitlab"
      }
    end,
  }
}

vim.opt.relativenumber = true -- relative line numbers

-- tmux navigator
vim.g.tmux_navigator_no_mappings = 1
lvim.keys.normal_mode["<C-h>"] = "<cmd>TmuxNavigateLeft<cr>"
lvim.keys.normal_mode["<C-j>"] = "<cmd>TmuxNavigateDown<cr>"
lvim.keys.normal_mode["<C-k>"] = "<cmd>TmuxNavigateUp<cr>"
lvim.keys.normal_mode["<C-l>"] = "<cmd>TmuxNavigateRight<cr>"
lvim.builtin.which_key.setup.plugins.presets.z = true
lvim.builtin.nvimtree.setup.view.side = "right"

