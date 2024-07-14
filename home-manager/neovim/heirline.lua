local heirline = require "heirline"
local heirline_components = require "heirline-components.all"

heirline_components.init.subscribe_to_events()
heirline.load_colors(heirline_components.hl.get_colors())

vim.islist = vim.tbl_islist -- NOTE: until we update to neovim 0.10

heirline.setup({
  statusline = {
    hl = { fg = "fg", bg = "bg" },
    heirline_components.component.mode(),
    heirline_components.component.git_branch(),
    heirline_components.component.file_info(),
    heirline_components.component.git_diff(),
    heirline_components.component.diagnostics(),
    heirline_components.component.fill(),
    heirline_components.component.cmd_info(),
    heirline_components.component.fill(),
    -- heirline_components.component.lsp(),
    heirline_components.component.compiler_state(),
    -- heirline_components.component.virtual_env(),
    heirline_components.component.nav(),
    heirline_components.component.mode { surround = { separator = "right" } },
  },
  tabline = { -- UI upper bar
    heirline_components.component.tabline_conditional_padding(),
    heirline_components.component.tabline_buffers(),
    heirline_components.component.fill { hl = { bg = "tabline_bg" } },
    heirline_components.component.tabline_tabpages()
  },
  winbar = { -- UI breadcrumbs bar
    init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
    fallthrough = false,
    {
      heirline_components.component.neotree(),
      heirline_components.component.compiler_play(),
      heirline_components.component.fill(),
      heirline_components.component.breadcrumbs(),
      heirline_components.component.fill(),
      heirline_components.component.compiler_redo(),
      heirline_components.component.aerial(),
    }
  },
  statuscolumn = { -- UI left column
    init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
    heirline_components.component.foldcolumn(),
    heirline_components.component.numbercolumn(),
    heirline_components.component.signcolumn(),
  } or nil,
  statusline = { -- UI statusbar
    hl = { fg = "fg", bg = "bg" },
    heirline_components.component.mode(),
    heirline_components.component.git_branch(),
    heirline_components.component.file_info(),
    heirline_components.component.git_diff(),
    heirline_components.component.diagnostics(),
    heirline_components.component.fill(),
    heirline_components.component.cmd_info(),
    heirline_components.component.fill(),
    -- heirline_components.component.lsp(),
    heirline_components.component.compiler_state(),
    -- heirline_components.component.virtual_env(),
    heirline_components.component.nav(),
    heirline_components.component.mode { surround = { separator = "right" } },
  },
})
