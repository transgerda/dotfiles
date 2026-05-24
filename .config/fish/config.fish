if status is-interactive
    zoxide init fish | source
    atuin init fish --disable-up-arrow | source

    alias a='lsd -lah'
    alias lg=lazygit
    alias ptest='composer dump-autoload && php artisan test'

    set -x LD_LIBRARY_PATH /run/current-system/sw/lib $LD_LIBRARY_PATH
    set -x YDOTOOL_SOCKET /run/ydotoold/socket
    set -x EDITOR nvim
    set -g fish_greeting ""
    set -Ux PATH $HOME/.local/share/nvim/mason/bin $PATH

    fish_vi_key_bindings
end
