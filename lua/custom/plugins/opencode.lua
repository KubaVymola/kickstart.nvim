vim.pack.add { { src = 'https://github.com/nickjvandyke/opencode.nvim', version = vim.version.range '*' } } -- Latest stable release

---@type opencode.Opts
vim.g.opencode_opts = {
  -- Your configuration, if any; goto definition on the type or field for details
}

vim.o.autoread = true -- Required for `opts.events.reload`

-- Recommended/example keymaps
-- vim.keymap.set({ 'n', 't' }, '<C-.>', function()
--   require('opencode').toggle()
-- end, { desc = 'Toggle opencode' })

vim.keymap.set({ 'n', 'x' }, '<leader>o', '<Nop>', { desc = '+opencode' })
vim.keymap.set({ 'n', 'x' }, '<leader>oo', function() require('opencode').toggle() end, { desc = 'Toggle open code' })

vim.keymap.set({ 'n', 'x' }, '<leader>or', function() return require('opencode').operator '@this ' end, { desc = 'Add range to opencode', expr = true })
vim.keymap.set('n', '<leader>ol', function() return require('opencode').operator '@this ' .. '_' end, { desc = 'Add line to opencode', expr = true })

vim.keymap.set({ 'n', 'x' }, '<leader>oa', function() require('opencode').select() end, { desc = 'Execute opencode action…' })
vim.keymap.set({ 'n', 'x' }, '<leader>oi', function() require('opencode').ask('@this: ', { submit = true }) end, { desc = 'Ask opencode…' })
