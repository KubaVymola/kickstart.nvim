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
      -- gemini = function()
      --   return require("codecompanion.adapters").extend("gemini", {
      --     env = {
      --       api_key = "cmd:op read op://personal/Gemini_API/credential --no-newline",
      --     },
      --   })
      -- end,
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
        adapter = 'copilot',
        roles = {
          user = 'kubavymola',
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
      inline = { adapter = 'copilot' },
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
      diff = {
        provider = 'mini_diff',
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
