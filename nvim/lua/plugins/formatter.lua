-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.DEBUG,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order

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

    --lua = {
    --  require("formatter.filetypes.lua").luafmt,
    --},


    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    --["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
     -- require("formatter.filetypes.any").remove_trailing_whitespace
    --}
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
