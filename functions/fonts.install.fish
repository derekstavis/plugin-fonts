function fonts.install -a name

  if test -e "$FONTS_CONFIG/$name"
    echo "Font $name already installed"
    return 1
  end

  if not contains $name (__fonts.repo.list)
    echo "Font $name not available for installing"
    return 1
  end

  if set tmpdir (mktemp -d "/tmp/font-$name.XXXXXX" ^&-)
    if wget -P $tmpdir -q --show-progress -- (__fonts.repo.urls "$name")
      echo 'Fonts downloaded with success'
    else
      echo 'Failed downloading font file'
      rm -rf $tmpdir
      return 1
    end

    basename -a $tmpdir/* > $FONTS_CONFIG/$name

    mkdir -p $FONTS_PATH

    if not mv $tmpdir/* $FONTS_PATH ^&-
      rm -rf $FONTS_CONFIG/$name
      echo 'Error installing font files'
      return 1
    end

    rm -rf $tmpdir
    return 0
  else
    echo 'Could not create temporary directory'
    return 1
  end

end
