require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- nohlsearch
map('n', '<CR>', ":nohlsearch<CR> <CR>")

-- lets me switch buffers easier
map('n', '<leader>[', ':bp<CR>')
map('n', '<leader>]', ':bn<CR>')

-- tmux pane changing keybinds
map('n', '<A-h>', ':TmuxNavigateLeft<CR>')
map('n', '<A-j>', ':TmuxNavigateDown<CR>')
map('n', '<A-k>', ':TmuxNavigateRight<CR>')
map('n', '<A-l>', ':TmuxNavigateUp<CR>')
