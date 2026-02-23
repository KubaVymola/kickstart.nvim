return {
  'greggh/claude-code.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required for git operations
  },
  config = true,
  opts = {
    window = {
      split_ratio = 0.3,
      position = 'vertical',
    },
    keymaps = {
      toggle = {
        normal = '<C-,>', -- Normal mode keymap for toggling Claude Code, false to disable
        terminal = '<C-,>', -- Terminal mode keymap for toggling Claude Code, false to disable
        -- variants = {
        --   continue = '<leader>cC', -- Normal mode keymap for Claude Code with continue flag
        --   verbose = '<leader>cV', -- Normal mode keymap for Claude Code with verbose flag
        -- },
      },
      window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
      scrolling = true, -- Enable scrolling keymaps (<C-f/b>) for page up/down
    },
  },
  keys = {
    { '<leader>a', nil, desc = 'AI/Claude Code' },
    { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
    { '<leader>ar', '<cmd>ClaudeCodeResume<cr>', desc = 'Resume Claude' },
    { '<leader>aC', '<cmd>ClaudeCodeContinue<cr>', desc = 'Continue Claude' },
  },
}
