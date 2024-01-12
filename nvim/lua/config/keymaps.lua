-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remap jumps to keep items centered

local keymap = vim.keymap.set

keymap("n", "<C-u>", "<C-u>zz") -- Page Scroll up + center screen
keymap("n", "<C-d>", "<C-d>zz") -- Page Scroll down + center screen
keymap("n", "{", "{zz") -- Scroll down a Paragraph + center screen
keymap("n", "}", "}zz") -- Scroll up a Paragraph + center screen
keymap("n", "n", "nzz") -- Next search result + center scree
keymap("n", "N", "Nzz") -- Previous search result + center scree
