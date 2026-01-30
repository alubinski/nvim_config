local config = function()
  -- Get the palette directly from Kanagawa to ensure perfect matching
  local colors = require("kanagawa.colors").setup({ theme = 'dragon' }).palette

  require('lualine').setup {
    options = {
      theme = 'kanagawa', -- Essential to match the statusline bg to the theme
      globalstatus = true,
      section_separators = { left = ' ⟩ ', right = ' ⟨ ' },
      component_separators = { left = ' ⟩ ', right = ' ⟨ ' },
    },
    extensions = {'mason', 'lazy'},
    sections = {
      lualine_a = {
        {
          'mode',
          fmt = function(str) return str:sub(1,1) end,
        }
      },
      lualine_b = {
        {
          'location',
          color = { fg = colors.dragonRed }, -- Replaced eba0ac (pinkish)
        },
      },
      lualine_c = {
        {
          'diagnostics',
          sources = {'nvim_lsp'},
          sections = { 'error', 'warn', 'info', 'hint' },
          diagnostics_color = {
            error = 'DiagnosticError',
            warn  = 'DiagnosticWarn',
            info  = 'DiagnosticInfo',
            hint  = 'DiagnosticHint',
          },
          colored = true,
          update_in_insert = true,
          always_visible = true,
        },
        {
          'branch',
          color = { fg = colors.dragonBlue }, -- Replaced cba6f7 (purple)
        },
        {
          'diff',
          colored = true,
          symbols = {added = '󱇬 ', modified = '󱣳 ', removed = '󱘹 '},
          diff_color = {
            added    = { fg = colors.dragonGreen },
            modified = { fg = colors.dragonOrange },
            removed  = { fg = colors.dragonRed },
          },
        },
        {
          function()
            return require('lsp-progress').progress()
          end,
          color = { fg = colors.dragonAqua } -- Replaced 89b4fa (baby blue)
        },
        {
            require("action-hints").statusline,
            color = { fg = colors.dragonYellow }, -- Replaced f6b596 (peach)
        },
      },
      lualine_x = {
        { require('auto-session.lib').current_session_name },
      },
      lualine_y = {
        {
          'encoding',
          color = { fg = colors.dragonGreen }, -- Replaced a6e3a1 (vibrant green)
        },
      },
      lualine_z = {
        {
          'datetime',
          style = 'default'
        },
      },
    },
    tabline = {
      lualine_a = {
        {
          'buffers',
          show_filename_only = true,
          hide_filename_extension = false,
          show_modified_status = true,
          mode = 0,
          symbols = {
            modified = ' 󰷫',
            alternate_file = '󰷈 ',
            directory =  ' ',
          },
          -- Buffer colors to match Kanagawa
          buffers_color = {
            active = { fg = colors.dragonBlue, gui = 'bold' },
            inactive = { fg = colors.fujiGray },
          },
        }
      },
    },
  }

  vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    group = "lualine_augroup",
    pattern = "LspProgressStatusUpdated",
    callback = require("lualine").refresh,
  })
end

return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  config = config,
}
