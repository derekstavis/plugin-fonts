function fonts.remove -a name
    set target "$FONTS_CONFIG/$name"
    if not test -e $target
        echo "Font $name not installed"
        return 1
    end

    rm -rv $FONTS_PATH/(cat $target)
    rm -f $target 2>&-
end
