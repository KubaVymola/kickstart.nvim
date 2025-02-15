return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {},
  config = function()
    require('toggleterm').setup()

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      hidden = true,
      direction = 'float',
      on_open = function(term)
        vim.cmd 'startinsert!'
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
      end,
      -- function to run on closing the terminal
      on_close = function(term)
        vim.cmd 'startinsert!'
      end,
    }

    local node = Terminal:new {
      cmd = 'node',
      hidden = true,
      direction = 'float',
      on_open = function(term)
        vim.cmd 'startinsert!'
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
      end,
      -- function to run on closing the terminal
      on_close = function(term)
        vim.cmd 'startinsert!'
      end,
    }

    function _lazygit_toggle()
      lazygit:toggle()
    end
    function _node_toggle()
      node:toggle()
    end

    vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', { desc = '[T]oggle [F]floating terminal' })
    vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>ToggleTerm direction=horizontal<CR>', { desc = '[T]oggle Horizontal [T]erminal' })
    vim.api.nvim_set_keymap('n', '<leader>tl', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true, desc = '[T]oggle [L]azyGit terminal' })
    vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>lua _node_toggle()<CR>', { noremap = true, silent = true, desc = '[T]oggle [L]azyGit terminal' })
  end,
}
