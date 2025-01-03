vim.g.mapleader = " "
require("main_config")
-- Load project-specific configuration
local project_config = vim.fn.getcwd() .. "/.nvim.lua"
if vim.fn.filereadable(project_config) == 1 then
    dofile(project_config)
end
