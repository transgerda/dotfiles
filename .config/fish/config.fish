if status is-interactive
    zoxide init fish | source
    atuin init fish --disable-up-arrow | source

    alias a='lsd -lah'
    alias lg=lazygit
    alias ptest='composer dump-autoload && php artisan test'

    set -gx DOTNET_ROOT /nix/store/*dotnet-sdk-8.0.416*/share/dotnet

    set -x YDOTOOL_SOCKET /run/ydotoold/socket
    set -x EDITOR nvim
    set -g fish_greeting ""
    set -Ux PATH $HOME/.local/share/nvim/mason/bin $PATH

    fish_vi_key_bindings
end
