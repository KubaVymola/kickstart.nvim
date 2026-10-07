vim.pack.add { 'https://git.sr.ht/~swaits/scratch.nvim' }
require('scratch').setup {}

vim.keymap.set('n', '<leader>bs', '<cmd>Scratch<cr>', { desc = 'Scratch Buffer' })
vim.keymap.set('n', '<leader>bS', '<cmd>ScratchSplit<cr>', { desc = 'Scratch Buffer (split)' })
