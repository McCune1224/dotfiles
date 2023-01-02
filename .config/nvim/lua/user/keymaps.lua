-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Normal --



-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


-- Scroll Up and Down with keeping cursor centered
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "{", "{zz", opts)
keymap("n", "}", "}zz", opts)
keymap("n", "n", "nzz", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -4<CR>", opts)
keymap("n", "<C-Down>", ":resize +4<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)


-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope git_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fc", ":Telescope colorscheme<CR>", opts)


-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)


-- DAP
--[[ keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts) ]]
--[[ keymap("n", "<Up>", "<cmd>lua require'dap'.continue()<cr>", opts) ]]
--[[ keymap("n", "<Right>", "<cmd>lua require'dap'.step_into()<cr>", opts) ]]
--[[ keymap("n", "<Down>", "<cmd>lua require'dap'.step_over()<cr>", opts) ]]
--[[ keymap("n", "<Left>", "<cmd>lua require'dap'.step_out()<cr>", opts) ]]
--[[ keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts) ]]
--[[ keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts) ]]
--[[ keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts) ]]
--[[ keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts) ]]

-- Copilot
keymap("n", "<leader>cs", ":Copilot status<CR>", opts)
keymap("n", "<leader>cp", ":Copilot panel<CR>", opts)
keymap("n", "<leader>ch", ":Copilot help<CR>", opts)
