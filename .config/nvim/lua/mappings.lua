require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

nomap("n", "<leader>cm")
nomap("n", "<leader>b")

-- movement in command mode
map("c", "<A-b>", "<C-Left>", { desc = "move left word" })
map("c", "<A-f>", "<C-Right>", { desc = "move right word" })
map("c", "<C-a>", "<Home>", { desc = "move beginning of line" })
map("c", "<C-b>", "<Left>", { desc = "move left" })
map("c", "<C-d>", "<Del>", { desc = "delete letter" })
map("c", "<C-f>", "<Right>", { desc = "move right" })

-- quick command
map("n", "<leader>`", "<cmd>bNext<CR>", { desc = "go to next buffer" })
map("n", "<leader>n", "<cmd>Telescope notify<CR>", { desc = "telescope notify history" })

-- quit
map("n", "<leader>qq", "<cmd>qa<CR>", { desc = "quit all" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "quit all force" })

-- editor
map("n", "<C-u>", "<C-u>zz", { desc = "move half page up then centered" })
map("n", "<C-d>", "<C-d>zz", { desc = "move half page down then centered" })

-- tabufline
map("n", "<leader>bd", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })
map("n", "<leader>ba", "<cmd>bufdo bd<CR>", { desc = "buffer close all" })

-- tab
map("n", "<leader><Tab>d", "<cmd>tabclose<CR>", { desc = "tab close current" })
map("n", "<leader><Tab>n", "<cmd>tabnew<CR>", { desc = "tab new" })
map("n", "<leader><Tab>m", "<cmd>tabmove<CR>", { desc = "tab move" })

-- file
map("n", "<leader>fe", "<cmd>NvimTreeToggle<CR>", { desc = "nvim tree toggle" })
map("n", "<leader>fn", "<cmd>enew<CR>", { desc = "buffer new" })

-- find
map("n", "<leader>:", "<cmd>Telescope command_history<CR>", { desc = "telescope command history" })
map("n", "<leader>fc", "<cmd>Telescope git_commits<CR>", { desc = "telescope find commit" })

-- search
map("n", "<leader>sC", "<cmd>Telescope commands<CR>", { desc = "telescope search commands" })
map("n", "<leader>sd", "<cmd>Telescope diagnostics<CR>", { desc = "telescope search diagnostics" })
map("n", "<leader>st", "<cmd>TodoTelescope<CR>", { desc = "todo Telescope" })
map("n", "<leader>sw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })

-- ui
map("n", "<leader>un", "<cmd>Noice dismiss<CR>", { desc = "noice dismiss" })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "lazy" })

-- mason
map("n", "<leader>cmi", "<cmd>MasonInstallAll<CR>", { desc = "mason install all" })
map("n", "<leader>cmo", "<cmd>Mason<CR>", { desc = "mason" })
map("n", "<leader>cmu", "<cmd>MasonUpdate<CR>", { desc = "mason update" })

-- git
map("n", "<leader>gB", "<cmd>Gitsigns blame<CR>", { desc = "gitsigns blame" })
map("n", "<leader>gP", "<cmd>Neogit push<CR>", { desc = "neogit push" })
map("n", "<leader>gS", "<cmd>Neogit stash<CR>", { desc = "neogit stash" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "view branches" })
map("n", "<leader>gc", "<cmd>Neogit commit<CR>", { desc = "neogit commit" })
map("n", "<leader>gd", "<cmd>Neogit diff<CR>", { desc = "neogit diff" })
map("n", "<leader>gf", "<cmd>Neogit fetch<CR>", { desc = "neogit fetch" })
map("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "open neogit tab" })
map("n", "<leader>gl", "<cmd>Neogit log<CR>", { desc = "neogit log" })
map("n", "<leader>gp", "<cmd>Neogit pull<CR>", { desc = "neogit pull" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })

-- fterm
vim.keymap.set({ "n", "t" }, "<A-i>", function()
  require("FTerm").toggle()
end)

-- todo comments
local todo = require "todo-comments"
map("n", "]t", function()
  todo.jump_next()
end, { desc = "next todo comment" })
map("n", "[t", function()
  todo.jump_prev()
end, { desc = "previous todo comment" })

-- can also specify a list of valid jump keywords
-- vim.keymap.set("n", "]t", function()
--   require("todo-comments").jump_next { keywords = { "ERROR", "WARNING" } }
-- end, { desc = "Next error/warning todo comment" })

-- go.nvim
map("n", "<leader>pat", "<cmd>GoAddTag<CR>", { desc = "add Go tag" })
map("n", "<leader>pfs", "<cmd>GoFillStruct<CR>", { desc = "auto fill Go struct" })
map("n", "<leader>pie", "<cmd>GoIfErr<CR>", { desc = "add Go if err" })
