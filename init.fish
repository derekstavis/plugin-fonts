function init -a path --on-event init_fonts
  set -g FONT_MOCK_INDEX "$path/mock_index.json"
  set -g FONT_MOCK_SHOW "$path/mock_show.json"

  set -q XDG_DATA_HOME;
      or set -l XDG_DATA_HOME "$HOME/.local"

  set -q FONTS_PATH;
    or set -g FONTS_PATH "$XDG_DATA_HOME/share/fonts"

  set -g FONTS_CONFIG "$OMF_CONFIG/fonts"

  mkdir -p $FONTS_CONFIG

end
