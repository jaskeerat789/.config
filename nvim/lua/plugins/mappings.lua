local harpoon = require "harpoon"
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
          -- Harpoon
          ["<leader>h"] = {desc="harpoon"},
          ["<C-e>"] = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon menu"},
          ["<leader>ha"] = { function() harpoon:list():add() end, desc = "Harpoon add"},
          ["<leader>hr"] = { function() harpoon:list():remove() end, desc = "Harpoon remove"},
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
          ["<Esc>"] = {
            "<C-\\><C-n>",
            desc = "Terminal Normal Vim Mode",
          },
        },
        v = {
          ["d"] = {
            '"_d',
            desc = "Delete without cutting / replace old buffer",
          },
          ["D"] = {
            '"_D',
            desc = "Delete line without cutting / replace old buffer",
          },
          ["p"] = {
            '"_dP',
            desc = "Paste without replacing your buffer",
          },
          ["P"] = {
            '"_dP',
            desc = "Paste without replacing your buffer",
          },
          ["<S-Up>"] = {
            ":'<,'> MoveBlock(-1)<CR>",
            desc = "Move block up",
          },
          ["<S-Down>"] = {
            ":'<,'> MoveBlock(1)<CR>",
            desc = "Move block down",
          },
          ["<S-k>"] = {
            ":'<,'> MoveBlock(-1)<CR>",
            desc = "Move block up",
          },
          ["<S-j>"] = {
            ":'<,'> MoveBlock(1)<CR>",
            desc = "Move block down",
          },
        },
      }
    }
  }
}
