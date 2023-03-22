return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "astrodark",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      "omnisharp",
      -- "pyright"
    },
        -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      omnisharp = function()
        -- local pid = vim.fn.getpid()
        -- local omnisharp_bin = "/home/user/software/omnisharp/run"
        -- return {
        --   cmd = {
        --     omnisharp_bin,
        --     "--languageserver",
        --     "--hostPID",
        --     tostring(pid)
        --   };
        --   -- root_dir = nvim_lsp.util.root_pattern("*.csproj", "*.sln");
        --   root_dir = require("lspconfig.util").root_pattern("*.csproj", "*.sln");
        -- }
        -- OTHER
        local lspconfig = require "lspconfig"
        local pid = vim.fn.getpid()
        local omnisharp_bin = "/home/user/software/omnisharp/omnisharp/OmniSharp.exe"

        return {
          cmd = { "mono", omnisharp_bin, "--languageserver","--hostPID", tostring(pid) },
          filetypes = { "cs", "vb" },
          init_options = {},
          on_new_config = function(new_config, new_root_dir)
            if new_root_dir then
              table.insert(new_config.cmd, '-s')
              table.insert(new_config.cmd, new_root_dir)
            end
          end,
          root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln");
          -- root_dir = require("lspconfig.util").root_pattern("*.csproj", "*.sln");
        }
      end,
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    vim.api.nvim_create_augroup("c_conf", {})
    vim.api.nvim_create_autocmd("FileType", {
      desc = "Set tabstop for C and C++ files",
      group = "c_conf",
      pattern = "cpp",
      command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2",
      --command = "setlocal noexpandtab tabstop=2 shiftwidth=2 softtabstop=2",
    })
  end,
}
