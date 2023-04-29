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

-- #################################
-- Normal
-- #################################

-- Better window navigation
keymap("n", "<C-k>", "<C-w>k", opts) -- Move to top window
keymap("n", "<C-j>", "<C-w>j", opts) -- Move to bottom window
keymap("n", "<C-h>", "<C-w>h", opts) -- Move to left window
keymap("n", "<C-l>", "<C-w>l", opts) -- Move to right window

keymap("n", "]]", ":bnext<CR>", opts) -- Next buffer
keymap("n", "[[", ":bprevious<CR>", opts) -- Previous buffer

-- Line relocation
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts) -- Move line/block in visual up
keymap("n", "<A-k>", ":m .-2<CR>==", opts) -- Move line in normal down
keymap("n", "<A-j>", ":m .+1<CR>==", opts) -- Move line in normal up
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts) -- Move line/block in visual down

-- Scrolling
keymap("n", "<C-u>", "<C-u>zz", opts) -- Page Scroll up + center screen
keymap("n", "<C-d>", "<C-d>zz", opts) -- Page Scroll down + center screen
keymap("n", "{", "{zz", opts) -- Scroll down a Paragraph + center screen
keymap("n", "}", "}zz", opts) -- Scroll up a Paragraph + center screen
keymap("n", "n", "nzz", opts) -- Next search result + center screen

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -4<CR>", opts) -- Resize window up
keymap("n", "<C-Down>", ":resize +4<CR>", opts) -- Resize window down
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts) -- Resize window left
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts) -- Resize window right

keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts) -- Clear search highlight

keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts) -- Close current buffer

-- #################################
-- Visual
-- #################################

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- #################################
--  Plugins
-- #################################

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts) -- Toggle NvimTree

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts) -- Search files
keymap("n", "<leader>fg", ":Telescope git_files<CR>", opts) -- Search git tracked files
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts) -- Search via grep
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts) -- Search projects
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts) -- Search open buffers
keymap("n", "<leader>fc", ":Telescope colorscheme<CR>", opts) -- Colorscheme picker

-- Git (vim-fugitive)
keymap("n", "<leader>gs", ":Git<CR>", opts) -- Git
keymap("n", "<leader>gb", ":Git blame<CR>", opts) -- Git blame
keymap("n", "<leader>gl", ":Glog<CR>", opts) -- Git log
-- push/pull
keymap("n", "<leader>gp", ":Git push<CR>", opts) -- Git push
keymap("n", "<leader>gP", ":Git pull<CR>", opts) -- Git pull

keymap("n", "<leader>gc", ":Git commit<CR>", opts) -- Git commit
keymap("n", "<leader>gC", ":Git commit -v<CR>", opts) -- Git commit (verbose)
keymap("n", "<leader>gca", ":Git commit --amend<CR>", opts) -- Git commit amend
keymap("n", "<leader>gco", ":Git checkout<CR>", opts) -- Git checkout

keymap("n", "<leader>gd", ":Gdiffsplit<CR>", opts) -- Git diff (split)
keymap("n", "<leader>gm", ":Gvdiffsplit<CR>", opts) -- Git diff (vertical split)
keymap("n", "<leader>gM", ":Gvdiffsplit!<CR>", opts) -- Git diff (vertical split, force)

keymap("n", "<leader>gu", ":Gundo<CR>", opts) -- Git undo

-- stash
keymap("n", "<leader>gs", ":Gstash<CR>", opts) -- Git stash
keymap("n", "<leader>gS", ":Gstash pop<CR>", opts) -- Git stash pop

keymap("n", "<leader>gb", ":GBrowse<CR>", opts) -- Git browse
keymap("n", "<leader>gB", ":GBrowse!<CR>", opts) -- Git browse (force)

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
-- Just to test
-- Copilot
keymap("n", "<leader>cs", ":Copilot status<CR>", opts) -- Copilot status
keymap("n", "<leader>cp", ":Copilot panel<CR>", opts) -- Copilot panel
keymap("n", "<leader>ch", ":Copilot help<CR>", opts) -- Copilot help
