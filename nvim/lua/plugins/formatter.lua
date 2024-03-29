-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.DEBUG,

  filetype = {

    javascriptreact = {
      require("formatter.filetypes.javascriptreact").prettier,
    },

    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettier,
    },

    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },

    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },

    svelte = {
      require("formatter.filetypes.svelte").prettier,
    },

    jsonc = {
      require("formatter.filetypes.json").prettier,
    },

    markdown = {
      require("formatter.filetypes.markdown").prettier,
    },

    python = {
      require("formatter.filetypes.python").black,
    },

    --lua = {
    --  require("formatter.filetypes.lua").luafmt,
    --},


    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup('__formatter__', { clear = true })
autocmd('BufWritePost', {
	group = '__formatter__',
	command = ':FormatWrite',
})
--autocmd('User', {
--	group = '__formatter__',
--    pattern = 'FormatterPre',
--    callback = function() print("Before formatting") end,
--})
--autocmd('User', {
--	group = '__formatter__',
--    pattern = 'FormatterPost',
--    callback = function() print("After formatting") end,
--})
