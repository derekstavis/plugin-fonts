function fonts.install

    set name $argv[1]

    if set index (contains -i -- '--powerline' $argv; or contains -i -- '--google' $argv)
        set filter $argv[$index]
        set name $argv
        set -e name[$index]
    end

    if test -e "$FONTS_CONFIG/$name"
        echo "Font $name already installed"
        return 1
    end

    if not contains -- $name (__fonts.repo.list $filter)
        echo "Font $name not available for installing"
        return 1
    end

    if set tmpdir (mktemp -d "/tmp/font-$name.XXXXXX" 2>&-)
        if not set download_urls (__fonts.repo.urls $name $filter)
            printf "No %s$name%s font found. Try using %s--powerline%s option.\n" \
                (set_color -o) (set_color normal) (set_color -o) (set_color normal)
            return 1
        end

        if wget -P $tmpdir -q --show-progress -- $download_urls
            echo 'Fonts downloaded with success'
        else
            echo 'Failed downloading font file'
            rm -rf $tmpdir
            return 1
        end

        echo $filter | sed 's/--//g' >$FONTS_CONFIG/$name
        basename -a $tmpdir/* >>$FONTS_CONFIG/$name

        mkdir -p $FONTS_PATH

        if not mv $tmpdir/* $FONTS_PATH 2>&-
            rm -rf $FONTS_CONFIG/$name
            rm -rf $tmpdir
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
