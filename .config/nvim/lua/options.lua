-- default
require "nvchad.options"

-- custom

-- generic
local opt = vim.opt
opt.history = 20

-- direct variable-like
local o = vim.o
o.cursorlineopt = "both"
o.relativenumber = true
o.virtualedit = "all"
