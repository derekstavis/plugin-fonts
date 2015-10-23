function fonts.install -a name

  if not contains $name (__fonts.repo.list)
    echo "Font $name not available for installing"
    return 1
  end

  if set tmpdir (mktemp -d "/tmp/font-$name.XXXXXX" ^&-)
    if wget -P $tmpdir -q --show-progress -- (__fonts.repo.urls "$name")
      echo 'Fonts downloaded with success'
    else
      echo 'Failed downloading font file'
      return 1
    end

    basename $tmpdir/* > $FONTS_CONFIG/$name

    mkdir -p $FONTS_PATH

    if not mv $tmpdir/* $FONTS_PATH
      rm -rf $FONTS_CONFIG/$name
      echo 'Error installing font files'
    end

    rm -rf $tmpdir
  end

end
