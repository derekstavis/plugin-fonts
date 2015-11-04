set commands install remove list

function __fonts_complete_install
  __fonts.repo.list
end

function __fonts_complete_remove
  basename -a $FONTS_CONFIG/*
end

complete -c fonts -f -d "Simple font manager"

complete -c fonts -f -n "__fish_seen_subcommand_from install" -a "(__fonts_complete_install)"
complete -c fonts -f -n "__fish_seen_subcommand_from remove"  -a "(__fonts_complete_remove)"

complete -c fonts -f -n "__fish_use_subcommand" -a help    -d "Show help message"
complete -c fonts -f -n "__fish_use_subcommand" -a install -d "Download and install <font_name>"
complete -c fonts -f -n "__fish_use_subcommand" -a remove  -d "Remove a installed font"
