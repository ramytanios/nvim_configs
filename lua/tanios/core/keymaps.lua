vim.g.mapleader = " " -- space leader key

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "x", '"_x')
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- windows plit
keymap.set("n", "<leader>nh", ":nohl<CR>") -- example /keymap and then clear highlight
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- slit window horizontal
keymap.set("n", "<leader>se", "<C-w>=") -- make split equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split
-- general keymaps

-- managing tabs
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- open new tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- nvim tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles)
keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
keymap.set("n", "<leader>fs", require("telescope.builtin").live_grep)
keymap.set("n", "<leader>fc", require("telescope.builtin").grep_string) -- grep under cursor
keymap.set("n", "<leader>fb", require("telescope.builtin").buffers)
keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<cr>")
keymap.set("n", "<leader>fda", require("telescope.builtin").diagnostics)
keymap.set("n", "<leader>gtc", require("telescope.builtin").git_commits)
keymap.set("n", "<leader>gtb", require("telescope.builtin").git_branches)
keymap.set("n", "<leader>gts", require("telescope.builtin").git_status)

-- diagnostic in a float
keymap.set("n", "<leader>D", function() vim.diagnostic.open_float() end, opts)

-- oil nvim
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
