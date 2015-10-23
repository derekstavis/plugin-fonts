function fonts.remove -a name
  set target "$FONTS_CONFIG/$name"
  if not test -e $target
    echo "Font $name not installed"
  end

  rm -r (cat $target) ^&-
  rm $target ^&-
end
