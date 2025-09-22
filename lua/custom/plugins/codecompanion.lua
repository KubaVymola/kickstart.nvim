return {
  'olimorris/codecompanion.nvim', -- The KING of AI programming
  dependencies = {
    'j-hui/fidget.nvim', -- Display status
    'ravitemer/codecompanion-history.nvim', -- Save and load conversation history
    -- {
    --   "ravitemer/mcphub.nvim", -- Manage MCP servers
    --   cmd = "MCPHub",
    --   build = "npm install -g mcp-hub@latest",
    --   config = true,
    -- },
    -- {
    --   "Davidyz/VectorCode", -- Index and search code in your repositories
    --   version = "*",
    --   build = "pipx upgrade vectorcode",
    --   dependencies = { "nvim-lua/plenary.nvim" },
    -- },
    -- {
    --   "HakonHarnes/img-clip.nvim", -- Share images with the chat buffer
    --   event = "VeryLazy",
    --   cmd = "PasteImage",
    --   opts = {
    --     filetypes = {
    --       codecompanion = {
    --         prompt_for_file_name = false,
    --         template = "[Image]($FILE_PATH)",
    --         use_absolute_path = true,
    --       },
    --     },
    --   },
    -- },
    -- { "echasnovski/mini.pick", config = true },
    -- { "ibhagwan/fzf-lua", config = true },
  },
  opts = {
    extensions = {
      history = {
        enabled = true,
        opts = {
          keymap = 'gh',
          save_chat_keymap = 'sc',
          auto_save = false,
          auto_generate_title = true,
          continue_last_chat = false,
          delete_on_clearing_chat = false,
          picker = 'snacks',
          enable_logging = false,
          dir_to_save = vim.fn.stdpath 'data' .. '/codecompanion-history',
        },
      },
      -- mcphub = {
      --   callback = "mcphub.extensions.codecompanion",
      --   opts = {
      --     make_vars = true,
      --     make_slash_commands = true,
      --     show_result_in_chat = true,
      --   },
      -- },
      -- vectorcode = {
      --   opts = {
      --     add_tool = true,
      --   },
      -- },
    },
    adapters = {
      http = {
        -- anthropic = function()
        --   return require("codecompanion.adapters").extend("anthropic", {
        --     env = {
        --       api_key = "cmd:op read op://personal/Anthropic_API/credential --no-newline",
        --     },
        --   })
        -- end,
        -- copilot = function()
        --   return require("codecompanion.adapters").extend("copilot", {
        --     schema = {
        --       model = {
        --         default = "gemini-2.5-pro",
        --       },
        --     },
        --   })
        -- end,
        -- deepseek = function()
        --   return require("codecompanion.adapters").extend("deepseek", {
        --     env = {
        --       api_key = "cmd:op read op://personal/DeepSeek_API/credential --no-newline",
        --     },
        --   })
        -- end,
        gemini = function()
          return require('codecompanion.adapters').extend('gemini', {
            url = 'https://generativelanguage.googleapis.com/v1beta/openai/chat/completions',
            env = {
              api_key = 'cmd:cat ~/.gemini-key-local',
            },
            headers = {
              Authorization = 'Bearer ${api_key}',
              ['Content-Type'] = 'application/json',
            },
          })
        end,
        -- mistral = function()
        --   return require("codecompanion.adapters").extend("mistral", {
        --     env = {
        --       api_key = "cmd:op read op://personal/Mistral_API/credential --no-newline",
        --     },
        --   })
        -- end,
        -- novita = function()
        --   return require("codecompanion.adapters").extend("novita", {
        --     env = {
        --       api_key = "cmd:op read op://personal/Novita_API/credential --no-newline",
        --     },
        --     schema = {
        --       model = {
        --         default = function()
        --           return "meta-llama/llama-3.1-8b-instruct"
        --         end,
        --       },
        --     },
        --   })
        -- end,
        -- ollama = function()
        --   return require("codecompanion.adapters").extend("ollama", {
        --     schema = {
        --       model = {
        --         default = "llama3.1:latest",
        --       },
        --       num_ctx = {
        --         default = 20000,
        --       },
        --     },
        --   })
        -- end,
        -- openai = function()
        --   return require("codecompanion.adapters").extend("openai", {
        --     opts = {
        --       stream = true,
        --     },
        --     env = {
        --       api_key = "cmd:op read op://personal/OpenAI_API/credential --no-newline",
        --     },
        --     schema = {
        --       model = {
        --         default = function()
        --           return "gpt-4.1"
        --         end,
        --       },
        --     },
        --   })
        -- end,
        -- xai = function()
        --   return require("codecompanion.adapters").extend("xai", {
        --     env = {
        --       api_key = "cmd:op read op://personal/xAI_API/credential --no-newline",
        --     },
        --   })
        -- end,
        -- tavily = function()
        --   return require("codecompanion.adapters").extend("tavily", {
        --     env = {
        --       api_key = "cmd:op read op://personal/Tavily_API/credential --no-newline",
        --     },
        --   })
        -- end,
      },
    },
    prompt_library = {
      -- ['Test workflow'] = {
      --   strategy = 'workflow',
      --   description = 'Use a workflow to test the plugin',
      --   opts = {
      --     index = 4,
      --   },
      --   prompts = {
      --     {
      --       {
      --         role = 'user',
      --         content = 'Generate a Python class for managing a book library with methods for adding, removing, and searching books',
      --         opts = {
      --           auto_submit = false,
      --         },
      --       },
      --     },
      --   },
      --   -- prompts https://github.com/olimorris/dotfiles/blob/fbb824889034a840b5a44742d2c9fd3a8d74abd2/.config/nvim/lua/plugins/coding.lua#L169
      -- },
    },
    strategies = {
      chat = {
        adapter = {
          name = 'gemini',
          model = 'gemini-2.5-pro',
        },
        keymaps = {
          send = {
            modes = {
              i = { '<C-CR>', '<C-s>' },
            },
          },
          completion = {
            modes = {
              i = '<C-x>',
            },
          },
        },
        slash_commands = {
          ['buffer'] = {
            keymaps = {
              modes = {
                i = '<C-b>',
              },
            },
          },
          ['fetch'] = {
            keymaps = {
              modes = {
                i = '<C-f>',
              },
            },
          },
          ['help'] = {
            opts = {
              max_lines = 1000,
            },
          },
          ['image'] = {
            keymaps = {
              modes = {
                i = '<C-i>',
              },
            },
            opts = {
              dirs = { '~/Documents/Screenshots' },
            },
          },
        },
        tools = {
          opts = {
            auto_submit_success = false,
            auto_submit_errors = false,
          },
        },
      },
      inline = { adapter = 'gemini' },
    },
    display = {
      action_palette = {
        provider = 'default',
      },
      chat = {
        -- show_references = true,
        -- show_header_separator = false,
        -- show_settings = false,
      },
    },
    diff = {
      enabled = true,
      provider = 'inline', -- mini_diff|split|inline

      provider_opts = {
        -- Options for inline diff provider
        inline = {
          layout = 'float', -- float|buffer - Where to display the diff

          diff_signs = {
            signs = {
              text = '▌', -- Sign text for normal changes
              reject = '✗', -- Sign text for rejected changes in super_diff
              highlight_groups = {
                addition = 'DiagnosticOk',
                deletion = 'DiagnosticError',
                modification = 'DiagnosticWarn',
              },
            },
            -- Super Diff options
            icons = {
              accepted = ' ',
              rejected = ' ',
            },
            colors = {
              accepted = 'DiagnosticOk',
              rejected = 'DiagnosticError',
            },
          },

          opts = {
            context_lines = 3, -- Number of context lines in hunks
            dim = 25, -- Background dim level for floating diff (0-100, [100 full transparent], only applies when layout = "float")
            full_width_removed = true, -- Make removed lines span full width
            show_keymap_hints = true, -- Show "gda: accept | gdr: reject" hints above diff
            show_removed = true, -- Show removed lines as virtual text
          },
        },

        -- Options for the split provider
        split = {
          close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
          layout = 'vertical', -- vertical|horizontal split
          opts = {
            'internal',
            'filler',
            'closeoff',
            'algorithm:histogram', -- https://adamj.eu/tech/2024/01/18/git-improve-diff-histogram/
            'indent-heuristic', -- https://blog.k-nut.eu/better-git-diffs
            'followwrap',
            'linematch:120',
          },
        },
      },
    },
    opts = {
      log_level = 'DEBUG',
    },
  },
  init = function()
    vim.cmd [[cab cc CodeCompanion]]

    vim.keymap.set('n', '<leader>cc', '<cmd>CodeCompanionActions<CR>', { desc = '[C]ode [C]ompanion actions' })
    vim.keymap.set('n', '<leader>ch', '<cmd>CodeCompanionChat Toggle<CR>', { desc = '[C]ode companion c[H]at' })
    vim.keymap.set('n', '<leader>cp', ':CodeCompanionCmd ', { desc = '[C]ode companion [P]rompt' })

    -- require('legendary').keymaps {
    --   {
    --     itemgroup = 'CodeCompanion',
    --     icon = '',
    --     description = 'Use the power of AI...',
    --     keymaps = {
    --       {
    --         '<Leader>cc',
    --         '<cmd>CodeCompanionActions<CR>',
    --         description = 'Open the action palette',
    --         mode = { 'n', 'v' },
    --       },
    --       {
    --         '<Leader>ct',
    --         '<cmd>CodeCompanionChat Toggle<CR>',
    --         description = 'Toggle a chat buffer',
    --         mode = { 'n', 'v' },
    --       },
    --       {
    --         '<Leader>ch',
    --         '<cmd>CodeCompanionChat Add<CR>',
    --         description = 'Add code to a chat buffer',
    --         mode = { 'v' },
    --       },
    --     },
    --   },
    -- }
    -- require('plugins.custom.spinner'):init()
  end,
}
