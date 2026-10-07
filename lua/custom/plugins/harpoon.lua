vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
}

local harpoon = require 'harpoon'
harpoon:setup()

vim.keymap.set('n', '<leader>j', function() harpoon:list():add() end, { desc = 'Harpoon list append' })
vim.keymap.set('n', '<leader><leader>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'harpoon quick menu' })
vim.keymap.set('n', '<leader>C', function() harpoon:list():clear() end, { desc = 'harpoon clear all' })
vim.keymap.set('n', '<C-j><C-h>', function() harpoon:list():select(1) end, { desc = 'harpoon to file 1' })
vim.keymap.set('n', '<C-j><C-j>', function() harpoon:list():select(2) end, { desc = 'harpoon to file 2' })
vim.keymap.set('n', '<C-j><C-k>', function() harpoon:list():select(3) end, { desc = 'harpoon to file 3' })
vim.keymap.set('n', '<C-j><C-l>', function() harpoon:list():select(4) end, { desc = 'harpoon to file 4' })
