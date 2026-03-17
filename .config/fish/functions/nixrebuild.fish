function nixrebuild --description "Rebuild nixos"
    sudo nixos-rebuild switch --flake ~/.nixrc
end
