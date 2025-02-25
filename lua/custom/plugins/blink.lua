return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',

    version = '*',
    ---
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = { preset = 'super-tab' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },

      -- completion = {
      --   menu = {
      --     auto_show = function(ctx)
      --       return ctx.mode ~= 'cmdline'
      --     end,
      --   },
      -- },

      completion = {
        menu = {
          draw = {
            columns = { { 'kind_icon', 'label', gap = 1 }, { 'label_description' } },
            components = {
              label = {
                width = { fill = true, max = 60 },
                text = function(ctx)
                  return ctx.label .. ctx.label_detail
                end,
              },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 300,
          update_delay_ms = 150,
        },
      },

      -- completion.menu.draw.columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } }

      -- completion = {
      --
      -- }

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        min_keyword_length = function(ctx)
          -- only applies when typing a command, doesn't apply to arguments
          if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then
            return 2
          end
          return 0
        end,
      },

      signature = {
        enabled = true,
      },
    },
    opts_extend = { 'sources.default' },
  },
}
