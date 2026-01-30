return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        compile = true,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = { bold = true },
        keywordStyle = { italic = false, bold = true },
        statementStyle = { bold = true },
        typeStyle = { bold = true },
        colors = {
          palette = {
            -- Slightly increased saturation, but not "glowing"
            dragonBlue   = "#7FB4CA", -- Classic but firm blue
            dragonRed    = "#E46868", -- Clearer red than default but grounded
            dragonGreen  = "#87A987", -- Natural green
            dragonYellow = "#E6C384", -- Warm gold for types
            dragonOrange = "#FF9E3B", -- Visible orange for constants
            dragonAqua   = "#6A9589", -- Teal for namespaces
          },
        },
        overrides = function(colors)
          local p = colors.palette
          return {
            -- C++ Highlighting: bolding for contrast without changing bg
            ["@type"] = { fg = p.dragonYellow, bold = true },
            ["@type.builtin"] = { fg = p.dragonYellow, bold = true },
            ["@keyword"] = { fg = p.dragonRed, bold = true },
            ["@function"] = { fg = p.dragonBlue, bold = true },
            ["@constant"] = { fg = p.dragonOrange, bold = true },
            ["@operator"] = { fg = p.dragonOrange }, 
            ["@punctuation.bracket"] = { fg = "#C8C093" }, -- Subtle beige brackets
            -- LSP C++ specifics: subtle distinction for members
            ["@lsp.type.class"] = { fg = p.dragonYellow, bold = true },
            ["@lsp.type.member"] = { fg = "#A3D4D5" }, -- Softer teal for class members
            ["@lsp.type.namespace"] = { fg = p.dragonAqua, italic = true },
            ["@lsp.type.macro"] = { fg = p.dragonRed, bold = true },
          }
        end,
      })

      vim.cmd("colorscheme kanagawa-dragon")
    end,
  }
}
