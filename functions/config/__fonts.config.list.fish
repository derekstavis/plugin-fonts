function __fonts.config.list.files -a name
  for line in (command cat $FONTS_CONFIG/$name)
    if not contains -- $line $__fonts_providers
      echo " - $line"
    end
  end
end

function __fonts.config.list
  contains -- '--powerline' $argv
    and set test 'powerline' '='

  contains -- '--files' $argv
    and set show_files

  for file in $FONTS_CONFIG/*
    if test $test (head -1 $file)
      set -l name (basename $file)
      echo $name
      set -q show_files
        and __fonts.config.list.files $name
    end
  end
end