-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- local map = vim.keymap.set
--
-- map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
-- map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
-- map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
-- map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
if vim.g.vscode then
    local map = vim.keymap.set
    local vscode = require("vscode")
    map("n", "gI", "<cmd>lua require('vscode').action('editor.action.goToImplementation')<CR>")
    map("n", "gr", "<cmd>lua require('vscode').action('editor.action.goToReferences')<CR>")
    map("n", "]d", "<cmd>lua require('vscode').action('editor.action.marker.nextInFiles')<CR>")
    map("n", "[d", "<cmd>lua require('vscode').action('editor.action.marker.prevInFiles')<CR>")
    map("n", "<leader>ca", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
    map("n", "<leader>e", function()
        -- vscode.action("workbench.view.explorer")
        vscode.action("workbench.action.toggleSidebarVisibility")
    end)
end
