vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local kind = ev.data.kind
    if ev.data.spec.name ~= 'tailwind-tools.nvim' or (kind ~= 'install' and kind ~= 'update') then return end

    -- `:UpdateRemotePlugins` only exists once the runtime plugins are sourced, which is after init.lua on first start
    local function update_remote_plugins()
      if not ev.data.active then vim.cmd.packadd 'tailwind-tools.nvim' end
      vim.cmd 'UpdateRemotePlugins'
    end
    if vim.v.vim_did_enter == 1 then
      update_remote_plugins()
    else
      vim.api.nvim_create_autocmd('VimEnter', { once = true, callback = update_remote_plugins })
    end
  end,
})

vim.pack.add { { src = 'https://github.com/garrett-hopper/tailwind-tools.nvim', version = 'vim-lsp-api' } }
require('tailwind-tools').setup {}
