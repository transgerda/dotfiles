function vim
  if test "$argv" = "" 
    nvim -c 'lua require("fzf-lua").files()'
  else
    nvim "$argv"
  end
end
