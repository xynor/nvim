-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
if vim.g.neovide then
    vim.o.guifont = "Hack Nerd Font Mono:h16"
    vim.g.neovide_input_macos_option_key_is_meta = "only_left"
end
