return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      multiwindow = true,
    },
    config = function()
      vim.keymap.set('n', '[C', function()
        require('treesitter-context').go_to_context(vim.v.count1)
      end, { silent = true, desc = 'Jump to context' })
    end,
  },
}
