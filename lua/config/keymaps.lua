local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Toggle centered cursor (999) vs standard context (10)
keymap.set('n', '<leader>to', function()
    if vim.opt.scrolloff:get() > 10 then
        vim.opt.scrolloff = 10
    else
        vim.opt.scrolloff = 999
    end
end, { desc = "Toggle Centered Cursor" })

-- center cursor with jump  
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "J", "mzJ`z") -- join line
keymap.set("n", "=ap", "ma=ap'a") -- indent paragraph

-- Enable Spell Check --
-- keymap.set('n', '<leader>sc', ':setlocal spell spelllang=en_us<CR>', opts)

-- Clear the current search word
keymap.set("n", "<C-c>", ":nohl<CR>", opts)

-- Directory Navigation --
keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", opts) -- Jump to tree
keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", opts) -- Toggle tree

-- Pane Navigation --
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Left 
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Right

-- Window Management -- 
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split Vertical
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split Horizontal

-- Buffer Management --
keymap.set("n", "<leader>n", ":bn<CR>", opts) -- Next Buffer 
keymap.set("n", "<leader>p", ":bp<CR>", opts) -- Previous Buffer 
keymap.set("n", "<leader>d", ":bd<CR>", opts) -- Close current buffer 
keymap.set("n", "<leader>o", ":enew<CR>", opts) -- Create a new empty buffer 

-- Code folding --
keymap.set("n", "<leader>fi", ":set foldmethod=indent<CR>") -- FOLD INDENT

-- Indenting --
keymap.set("v", "<", "<gv") -- Move left an indent
keymap.set("v", ">", ">gv") -- Move right an indent

-- Telescope --
keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>") -- Find key
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>") -- Find help
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>") -- Find files
keymap.set("n", "<leader>fa", ":Telescope <CR>") -- Find all
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>") -- Find grep
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>") -- Find byffers 
keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>") -- Find recent

-- Session Management --
keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>") -- Save Session
keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>") -- Restore Session
keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, opts)

-- VimTex Command --
-- <SPACE+L+C> (Latex Clean) cleans the directory with latex files after compiling.
-- keymap.set("n","<leader>lc", ":VimtexClean<CR>", {noremap = true})


-- moving code
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- CLIPBOARD
-- greatest remap ever - paste multiple times
keymap.set("x", "<leader>p", [["_dP]])
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])
keymap.set({ "n", "v" }, "<leader>x", "\"_d")
keymap.set("x", "R", [["_dP]], { desc = "Replace without overwriting register" })

-- search and replace
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


