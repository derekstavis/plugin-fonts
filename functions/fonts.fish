function fonts -a action name -d "A simple font manager"
  switch "$action"

  case list
    fonts.list

  case install
    if test -z "$name"
      echo 'Usage: fonts install <font-name>'
      return 1
    else
      fonts.install "$name"
    end

  case remove
    if test -z "$name"
      echo 'Usage: fonts remove <font-name>'
      return 1
    else
      fonts.remove "$name"
    end

  case help '*'
    fonts.help
  end

end
