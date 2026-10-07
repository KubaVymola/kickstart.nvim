vim.pack.add { { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' } }

require('harpoon'):setup()

vim.keymap.set('n', '<leader>j', function() require('harpoon'):list():add() end, { desc = 'Harpoon list append' })

vim.keymap.set('n', '<leader><leader>', function()
  local harpoon = require 'harpoon'
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'harpoon quick menu' })

vim.keymap.set('n', '<leader>C', function() require('harpoon'):list():clear() end, { desc = 'harpoon clear all' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'harpoon',
  callback = function(event)
    vim.keymap.set('n', '<C-c>', function() require('harpoon').ui:toggle_quick_menu() end, { buffer = event.buf, silent = true, desc = 'harpoon close quick menu' })
  end,
})

vim.keymap.set('n', '<C-j><C-h>', function() require('harpoon'):list():select(1) end, { desc = 'harpoon to file 1' })
vim.keymap.set('n', '<C-j><C-j>', function() require('harpoon'):list():select(2) end, { desc = 'harpoon to file 2' })
vim.keymap.set('n', '<C-j><C-k>', function() require('harpoon'):list():select(3) end, { desc = 'harpoon to file 3' })
vim.keymap.set('n', '<C-j><C-l>', function() require('harpoon'):list():select(4) end, { desc = 'harpoon to file 4' })

-- return {
--   {
--     'ThePrimeagen/harpoon',
--     branch = 'harpoon2',
--     dependencies = { 'nvim-lua/plenary.nvim' },
--     config = function()
--       require('harpoon'):setup()
--     end,
--     keys = {
--       {
--         '<leader>j',
--         function()
--           require('harpoon'):list():add()
--         end,
--         desc = 'Harpoon list append',
--       },
--       {
--         '<leader><leader>',
--         function()
--           local harpoon = require 'harpoon'
--           harpoon.ui:toggle_quick_menu(harpoon:list())
--         end,
--         desc = 'harpoon quick menu',
--       },
--       {
--         '<leader>C',
--         function()
--           require('harpoon'):list():clear()
--         end,
--         desc = 'harpoon clear all',
--       },
--       {
--         '<C-j><C-h>',
--         function()
--           require('harpoon'):list():select(1)
--         end,
--         desc = 'harpoon to file 1',
--       },
--       {
--         '<C-j><C-j>',
--         function()
--           require('harpoon'):list():select(2)
--         end,
--         desc = 'harpoon to file 2',
--       },
--       {
--         '<C-j><C-k>',
--         function()
--           require('harpoon'):list():select(3)
--         end,
--         desc = 'harpoon to file 3',
--       },
--       {
--         '<C-j><C-l>',
--         function()
--           require('harpoon'):list():select(4)
--         end,
--         desc = 'harpoon to file 4',
--       },
--     },
--   },
-- }
