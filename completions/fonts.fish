function __fonts_complete_install
  set -l filter (commandline --tokenize | grep -- '--*' | head -1)
  __fonts.repo.list $filter
end

function __fonts_complete_remove
  basename -a $FONTS_CONFIG/*
end

complete -c fonts -f -d "Simple font manager"

complete -c fonts -f -n "__fish_seen_subcommand_from list" -l installed -d "Show fonts installed by this program"
complete -c fonts -f -n "__fish_seen_subcommand_from list" -l available -d "Show only fonts available to install"
complete -c fonts -f -n "__fish_seen_subcommand_from list" -l google    -d "List only fonts from Google Fonts repository"
complete -c fonts -f -n "__fish_seen_subcommand_from list" -l powerline -d "List only fonts from Powerline Fonts repostory"
complete -c fonts -f -n "__fish_seen_subcommand_from install" -a "(__fonts_complete_install)"
complete -c fonts -f -n "__fish_seen_subcommand_from install" -l google    -d "Install font from Google repository"
complete -c fonts -f -n "__fish_seen_subcommand_from install" -l powerline -d "Install font from Powerline repository"
complete -c fonts -f -n "__fish_seen_subcommand_from install" -l nerdfonts -d "Install font from Nerdfonts repository"
complete -c fonts -f -n "__fish_seen_subcommand_from remove"  -a "(__fonts_complete_remove)"

complete -c fonts -f -n "__fish_use_subcommand" -a help    -d "Show help message"
complete -c fonts -f -n "__fish_use_subcommand" -a install -d "Download and install <font_name>"
complete -c fonts -f -n "__fish_use_subcommand" -a remove  -d "Remove a installed font"
complete -c fonts -f -n "__fish_use_subcommand" -a list    -d "List installed fonts"
