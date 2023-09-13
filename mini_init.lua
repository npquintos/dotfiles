local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
{ 'echasnovski/mini.nvim', version = false },
{
  'ribru17/bamboo.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('bamboo').setup {}
    require('bamboo').load()
  end,
  },
})
require('mini.pairs').setup({})
require('mini.cursorword').setup({})
require('mini.files').setup({})
require('mini.fuzzy').setup({})
require('mini.hipatterns').setup({})
require('mini.indentscope').setup({})
require('mini.jump').setup({})
require('mini.jump2d').setup({})
require('mini.splitjoin').setup({})
require('mini.tabline').setup({})
require('mini.trailspace').setup({})
