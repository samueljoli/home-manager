require('nvim-treesitter.install').prefer_git = true

require('nvim-treesitter.configs').setup({
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
