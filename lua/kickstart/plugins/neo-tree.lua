-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  default_component_configs = {
    name = {
      -- Don't recolor the filename text based on git status (e.g. modified
      -- files ending up the same color as directories); keep git status
      -- shown via the status column/icons instead.
      -- use_git_status_colors = false,
      trailing_slash = true,
    },
    -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
    file_size = {
      enabled = false,
      width = 12, -- width of the column
      required_width = 64, -- min width of window required to show this column
    },
    type = {
      enabled = false,
      width = 10, -- width of the column
      required_width = 122, -- min width of window required to show this column
    },
    last_modified = {
      enabled = false,
      width = 20, -- width of the column
      required_width = 88, -- min width of window required to show this column
    },
    created = {
      enabled = false,
      width = 20, -- width of the column
      required_width = 110, -- min width of window required to show this column
    },
    symlink_target = {
      enabled = false,
    },
  },
  filesystem = {
    use_libuv_file_watcher = true,
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      never_show = {
        '.DS_Store',
        'thumbs.db',
      },
    },
    window = {
      width = 60,
      mappings = {
        ['\\'] = 'close_window',
        ['l'] = 'open',
        ['h'] = 'close_node',
      },
    },
  },
}

-- vim.cmd 'highlight NeoTreeGitModified guifg=Red'
