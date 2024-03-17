-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local harpoon = require("harpoon")

--NORMAL MODE

-- Tabs / buffers
keymap.set("n", "<tab>", ":bnext<Return>", opts)
keymap.set("n", "<s-tab>", ":bprev<Return>", opts)
keymap.set("n", "<leader>q", ":bd<Return>", opts)

-- Harpoon
harpoon:setup()
keymap.set("n", "<leader>a", function()
  harpoon:list():append()
end)
keymap.set("n", "<leader>e", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)
keymap.set("n", "<C-p>", function()
  harpoon:list():next()
end)
keymap.set("n", "<C-o>", function()
  harpoon:list():prev()
end)

-- Navigation
keymap.set("n", "<C-d>", "<C-d>zz", opts)
keymap.set("n", "<C-u>", "<C-u>zz", opts)
keymap.set("n", "n", "nzz", opts)
keymap.set("n", "N", "Nzz", opts)

-- VISUAL MODE:

-- Indenting and staying on visual mode
keymap.set("v", "<s-tab>", "<gv", opts)
keymap.set("v", "<tab>", ">gv", opts)

-- Move lines up/down and stay on visual line mode
keymap.set("x", "J", [[:m'>+1<CR>`>v`<]], opts)
keymap.set("x", "K", [[:m'<-2<CR>`<v`>]], opts)

-- Toggle comment selection on visual line mode
keymap.set("x", "<leader>c", [[:s/^/#/g<CR>]], opts)
