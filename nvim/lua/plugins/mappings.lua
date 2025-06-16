local harpoon = require "harpoon"
local kalulu = require "kulala"
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<C-\\>"] = {
            "<cmd>ToggleTerm direction=float<CR>",
            desc = "Toggle Terminal",
          },
          ["dd"] = {
            '"_dd',
            desc = "Delete without cutting / replace old buffer",
          },
          --- cycle through buffers
          ["L"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["H"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          ["[b"] = false,
          ["]b"] = false,
          --- kalulu
          ["<leader>R"] = { desc = "kalulu" },
          ["<leader>Rs"] = { function() kalulu.run() end, desc = "run" },
          -- Harpoon
          ["<leader>h"] = { desc = "harpoon" },
          ["<leader>hm"] = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon menu" },
          ["<leader>ha"] = { function() harpoon:list():add() end, desc = "Harpoon add" },
          ["<leader>hr"] = { function() harpoon:list():remove() end, desc = "Harpoon remove" },
          ["<C-1>"] = { function() harpoon:list():select(1) end, desc = "Goto mark 1" },
          ["<C-2>"] = { function() harpoon:list():select(2) end, desc = "Goto mark 2" },
          ["<C-3>"] = { function() harpoon:list():select(3) end, desc = "Goto mark 3" },
          ["<C-4>"] = { function() harpoon:list():select(4) end, desc = "Goto mark 4" },
          ["<C-5>"] = { function() harpoon:list():select(5) end, desc = "Goto mark 5" },
          ["<C-6>"] = { function() harpoon:list():select(6) end, desc = "Goto mark 6" },
          ["<C-7>"] = { function() harpoon:list():select(7) end, desc = "Goto mark 6" },
        },
        t = {
          ["<C-\\>"] = {
            "<cmd>ToggleTerm<CR>",
            desc = "Toggle Terminal",
          },
        },
        v = {
          ["p"] = {
            '"_dP',
            desc = "Paste without replacing your buffer",
          },
          ["P"] = {
            '"_dP',
            desc = "Paste without replacing your buffer",
          },
        },
        -- v = {
        --   ["p"] = {
        --     '"_dP',
        --     desc = "Paste without replacing your buffer",
        --   },
        --   ["P"] = {
        --     '"_dP',
        --     desc = "Paste without replacing your buffer",
        --   },
        -- },
      },
    },
  },
}
