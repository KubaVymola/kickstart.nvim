vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim', -- Required for git operations
  'https://github.com/greggh/claude-code.nvim',
}
require('claude-code').setup {
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
}

vim.keymap.set('n', '<leader>a', '<Nop>', { desc = 'AI/Claude Code' })
vim.keymap.set('n', '<leader>ac', '<cmd>ClaudeCode<cr>', { desc = 'Toggle Claude' })
vim.keymap.set('n', '<leader>ar', '<cmd>ClaudeCodeResume<cr>', { desc = 'Resume Claude' })
vim.keymap.set('n', '<leader>aC', '<cmd>ClaudeCodeContinue<cr>', { desc = 'Continue Claude' })
