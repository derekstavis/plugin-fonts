function init -a path --on-event init_fonts

  autoload $path/functions/{config,repo}

  set -g __fonts_providers 'google' 'powerline'

  if not set -q FONTS_PATH
    if test 'Darwin' = (uname)
      set -g FONTS_PATH "$HOME/Library/Fonts"
    else
      set -q XDG_DATA_HOME; or set -l XDG_DATA_HOME "$HOME/.local"
      set -g FONTS_PATH "$XDG_DATA_HOME/share/fonts"
    end
  end

  set -g FONTS_CONFIG "$OMF_CONFIG/fonts"
  mkdir -p $FONTS_CONFIG

end
