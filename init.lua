require "core"

-- load custom settings
local custom_settings_path = vim.api.nvim_get_runtime_file("lua/custom/settings.lua", false)[1]

if custom_settings_path then
  dofile(custom_settings_path)
end

-- load custom keymappings
local custom_mappings_path = vim.api.nvim_get_runtime_file("lua/custom/mappings.lua", false)[1]

if custom_mappings_path then
  dofile(custom_mappings_path)
end

-- load custom mason
local custom_mason_path = vim.api.nvim_get_runtime_file("lua/custom/mason.lua", false)[1]

if custom_mason_path then
  dofile(custom_mappings_path)
end

-- load custom init file 
local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"
