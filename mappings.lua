---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
  x = {
    ["<leader>y"] = { "\"+y", opts = {silent = true} },
  }
}

M.symbol_outline= {
  n = {
    ["<S-t>"] = {"<CMD>SymbolsOutline<CR>", opts = {silent = true}},
  }
}

M.nvtree = {
  n = {
    ["<leader><tab>"] = {"<Cmd>NvimTreeToggle<CR>", opts = {silent = true} },
    ["<leader>n"] = {"<Cmd>new<CR><Cmd>NvimTreeToggle<CR>", opts = {silent = true}},
    ["<leader>f<tab>"] =  {"<Cmd>NvimTreeFindFileToggle<CR>", opts = {silent = true}},
    ["<leader>z"] = {"<Cmd>NvimTreeCollapse<CR>", opts = {silent = true} },
  }
}

M.lazygit = {
 n = {
    ["<leader>gg"] = {"<CMD>LazyGit<CR>", opts = {silent = true}},
  }

}

-- more keybinds!

return M
