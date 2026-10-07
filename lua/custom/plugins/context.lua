vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter-context' }
require('treesitter-context').setup {
  multiwindow = true,
}

vim.keymap.set('n', '[C', function() require('treesitter-context').go_to_context(vim.v.count1) end, { silent = true, desc = 'Jump to context' })
