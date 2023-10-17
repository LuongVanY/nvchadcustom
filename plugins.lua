local overrides = require("custom.configs.overrides")
local enum = require("custom.utils.enum")
local utils = require("custom.utils.util")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
  },

  { "kdheepak/lazygit.nvim",
    cmd = {"LazyGit"},
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function (_, _)
      return require(utils.findConfigFile(enum.noice))
    end,
    config = function (_, opts)
      require(enum.noice).setup(opts)
    end,
    dependencies = { { "MunifTanjim/nui.nvim" }, {
      "rcarriga/nvim-notify",
      opts = function (_, _)
        return require(utils.findConfigFile(enum.notify))
      end,
      config = function (_, opts)
        require(enum.notify).setup(opts)
      end,
    }, { "nvim-lua/plenary.nvim" } },
  },

  {
    "simrat39/symbols-outline.nvim",
    cmd = {"SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose"},
    opts = function (_, _)
      return require(utils.findConfigFile(enum.symbolsOutline))
    end,
    config = function (_, opts)
      require(enum.symbolsOutline).setup(opts)
    end,
  },
  {
    "f-person/git-blame.nvim",
    cmd = {"GitBlameOpenCommitURL", "GitBlameToggle"},
    opts = {
      enabled = true
    },
    config = function (_, _)
      require("gitblame").setup()
    end,

  },
     -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
