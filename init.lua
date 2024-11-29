-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
if vim.g.neovide then
    local os_name = jit.os
    if os_name == "OSX" then
        vim.o.guifont = "Hack Nerd Font:h16"
        vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
        vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
    else
        vim.o.guifont = "Hack Nerd Font:h14"
        vim.keymap.set("i", "<M-v>", '<ESC>l"+Pli') -- Paste insert mode
        vim.api.nvim_set_keymap("!", "<M-v>", "<C-R>+", { noremap = true, silent = true })
    end
    vim.g.neovide_input_macos_option_key_is_meta = "only_left"
    vim.g.neovide_position_animation_length = 0
    vim.g.neovide_cursor_animation_length = 0.00
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_cursor_animate_in_insert_mode = false
    vim.g.neovide_cursor_animate_command_line = false
end
