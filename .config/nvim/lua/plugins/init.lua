return {
  -- ------------------------------------------------------------------
  -- NvChad ecosystem pinned to exact commits (same as lazy-lock.json).
  -- Spec-level commits beat the lockfile, so accidental :Lazy update /
  -- :NvChadUpdate cannot pull versions that require nvim >= 0.11
  -- (breaks colorify/gitsigns on Debian's apt nvim 0.10).
  -- To upgrade: bump these commits + lazy-lock.json together.
  -- ------------------------------------------------------------------
  { "NvChad/NvChad", branch = "v2.5", commit = "262f103d3cbe22da7f352c9e01306cf5a34fd8a1" },
  { "NvChad/ui", branch = "v3.0", commit = "78c96eee08ad8eb73e39f7aeff8d978be40b3f91" },
  { "NvChad/base46", branch = "v3.0", commit = "19023074b28ef5554909d27d934353603df256f0" },
  { "NvChad/menu", branch = "main", commit = "7a0a4a2896b715c066cfbe320bdc048091874cc6" },
  { "NvChad/minty", branch = "main", commit = "aafc9e8e0afe6bf57580858a2849578d8d8db9e0" },

  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
    -- opts = require "configs.conform",
  },

  -- {
  --   "FtVim/norminette-lint.nvim", -- requires: pip install norminette
  --   config = function()
  --     require("norminette-lint").setup {
  --       enable_on_start = false, -- Default to false to improve startup performance
  --     }
  --   end,
  -- },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
  },
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "stylua",
        -- "clangd", -- C/C++ LSP
        -- "clang-format", -- C/C++ formatter
        -- "pyright", -- Python LSP (needs node+npm)
        -- "gopls", -- Go LSP
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "stylua",
        -- "clangd", -- C/C++ LSP
        -- "clang-format", -- C/C++ formatter
        -- "codelldb", -- DAP debugger (C/C++/Rust)
        -- "pyright", -- Python LSP (needs node+npm)
        -- "goimports", -- Go formatter
        -- "golangci-lint", -- Go linter
        -- "delve", -- Go DAP debugger
        -- "gofumpt", -- Go formatter
        -- "goimports-reviser", -- Go formatter
      },
    },
  },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",

    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        -- "c",
        -- "cpp",
        -- "python",
        -- "go",
        -- "gomod",
        -- "gosum",
        -- "gotmpl",
        -- "gowork",
        "sql",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "configs.lint"
    end,
  },

  -- {
  --   "rcarriga/nvim-dap-ui",
  --   event = "VeryLazy",
  --   dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  --   config = function()
  --     require("dapui").setup()
  --     local dap = require "dap"
  --     local dapui = require "dapui"
  --     dap.listeners.before.attach.dapui_config = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.launch.dapui_config = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated.dapui_config = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited.dapui_config = function()
  --       dapui.close()
  --     end
  --   end,
  -- },

  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "williamboman/mason.nvim",
  --     "mfussenegger/nvim-dap",
  --   },
  --   opts = {
  --     handlers = {
  --       codelldb = function()
  --         local dap = require "dap"
  --         local mason_path = vim.fn.stdpath "data" .. "/mason/packages/codelldb/extension/"
  --
  --         dap.adapters.codelldb = {
  --           type = "server",
  --           port = "${port}",
  --           executable = {
  --             command = mason_path .. "adapter/codelldb",
  --             args = { "--port", "${port}" },
  --           },
  --         }
  --
  --         dap.configurations.cpp = {
  --           {
  --             name = "Launch file",
  --             type = "codelldb",
  --             request = "launch",
  --             program = function()
  --               return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
  --             end,
  --             cwd = "${workspaceFolder}",
  --             stopOnEntry = false,
  --             args = {},
  --           },
  --         }
  --
  --         -- Link C and Rust to use the same config
  --         dap.configurations.c = dap.configurations.cpp
  --         dap.configurations.rust = dap.configurations.cpp
  --       end,
  --       -- 🐍 ADD THIS NEW HANDLER FOR PYTHON
  --       python = function()
  --         local dap_python = require "dap-python"
  --         local mason_path = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python"
  --         dap_python.setup(mason_path)
  --       end,
  --     },
  --   },
  -- },

  -- {
  --   "mfussenegger/nvim-dap",
  --   dependencies = {
  --     "williamboman/mason.nvim",
  --     "mfussenegger/nvim-dap-python",
  --     "rcarriga/nvim-dap-ui",
  --     "theHamsta/nvim-dap-virtual-text",
  --   },
  --   config = function()
  --     -- enable virtual text globally
  --     require("nvim-dap-virtual-text").setup {
  --       commented = true, -- show inline variable values
  --     }
  --   end,
  -- },

  -- {
  --   "leoluz/nvim-dap-go",
  --   ft = "go",
  --   dependencies = "mfussenegger/nvim-dap",
  --   opts = {}, -- auto-detects delve in Mason
  -- },

  {
    "kevinhwang91/nvim-bqf",
    lazy = false,
  },

  {
    "Diogo-ss/42-header.nvim",
    cmd = { "Stdheader" },
    keys = { "<F1>" },
    opts = {
      default_map = true, -- Default mapping <F1> in normal mode.
      auto_update = true, -- Update header when saving.
      user = "user42", -- Your user.
      mail = "user42@student.42heilbronn.de", -- Your mail.
      -- add other options.
    },
    config = function(_, opts)
      require("42header").setup(opts)
    end,
  },

  {
    "folke/snacks.nvim",
    lazy = false, -- <== important: loads immediately on startup
    priority = 1000, -- <== ensures it loads before nvchad/ui
    opts = {
      input = {},
      picker = {},
      terminal = {},
      notifier = { enabled = true },
      -- words = { enabled = true },
      -- indent = { enabled = true },

      dashboard = {
        enabled = true,
        sections = {
          {
            section = "terminal",
            cmd = "cat ~/.config/nvim/lua/dotb.ansi",
            random = 10,
            -- pane = 1,
            indent = 6,
            height = 25,
          },
          -- { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },

  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      -- "folke/snacks.nvim", -- optional
    },
    cmd = "Neogit",
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
      lsp = {
        signature = {
          enabled = false,
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    },
  },

  {
    "vimpostor/vim-tpipeline",
    lazy = false,
    config = function()
      vim.g.tpipeline_autoembed = 1
      vim.g.tpipeline_restore = 1
      vim.g.tpipeline_clearstl = 1
    end,
  },

  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = { { "<leader>y", "<cmd>Yazi<cr>", desc = "Open Yazi" } },
    opts = {},
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },

  {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
    config = function()
      require("treesj").setup {--[[ your config ]]
      }
    end,
  },

  {
    "nvim-mini/mini.surround",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup {
        mappings = {
          add = "gsa",
          delete = "gsd",
          replace = "gsr",
          find = "gsf",
          find_left = "gsF",
          highlight = "gsh",
          suffix_last = "l", -- Suffix to search with "prev" method
          suffix_next = "n", -- Suffix to search with "next" method
        },
      }
    end,
  },

  -- Databases: vim-dadbod + UI + completion
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      vim.list_extend(opts.sources, { { name = "vim-dadbod-completion" } })
    end,
  },
}
