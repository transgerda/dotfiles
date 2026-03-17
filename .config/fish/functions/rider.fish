function rider
    set -x LD_LIBRARY_PATH /run/current-system/sw/lib $LD_LIBRARY_PATH

    setsid /run/current-system/sw/bin/rider $argv >/dev/null 2>&1 < /dev/null &
    disown 
    exit
end

