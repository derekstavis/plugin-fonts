function fonts -a action -d "A simple font manager"
  test (count $argv) -gt 1
    and set options $argv[2..-1]
    or set options

  switch "$action"

  case list
    fonts.list $options

  case install
    if test -z "$options"
      echo 'Usage: fonts install <font-name>'
      return 1
    else
      fonts.install $options
    end

  case remove
    if test -z "$options"
      echo 'Usage: fonts remove <font-name>'
      return 1
    else
      fonts.remove "$options"
    end

  case help '*'
    fonts.help
  end

end
