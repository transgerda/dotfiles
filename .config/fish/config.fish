if status is-interactive
    zoxide init fish | source
    atuin init fish --disable-up-arrow | source

    alias 'a'='lsd -lah'
    alias 'lg'=lazygit

    set -x LD_LIBRARY_PATH /run/current-system/sw/lib $LD_LIBRARY_PATH
    set -x EDITOR nvim
    set -g fish_greeting ""

    fish_vi_key_bindings
end
