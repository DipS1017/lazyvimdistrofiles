-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Window navigation
keymap.set("n", "<c-k>", ":wincmd k<CR>", opts)
keymap.set("n", "<c-j>", ":wincmd j<CR>", opts)
keymap.set("n", "<c-h>", ":wincmd h<CR>", opts)
keymap.set("n", "<c-l>", ":wincmd l<CR>", opts)

-- Search
keymap.set("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Save and quit
keymap.set("n", "<leader>w", ":update<CR>", opts)  -- Saves the file if changed
keymap.set("n", "<leader>q", ":quit<CR>", opts)    -- Quits the current window
keymap.set("n", "<leader>Q", ":qa<CR>", opts)      -- Quits all windows


-- Horizontal scrolling
keymap.set("n", "<A-l>", "5zl", opts)
keymap.set("n", "<A-h>", "5zh", opts)
--tmux
   keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", {})
   keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", {})
   keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", {})
   keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", {})
 
