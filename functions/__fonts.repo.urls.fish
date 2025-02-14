function __fonts.repo.urls -a name
  set repo_url

  if set index (contains -i -- '--powerline' $argv; or contains -i -- '--google' $argv; or contains -i -- '--nerdfonts' $argv)
    set name $argv
    set -e name[$index]
  end

  if contains -- '--powerline' $argv
    set repo_url "https://api.github.com/repos/powerline/fonts/contents"/$name
  else if contains -- '--google' $argv
    set repo_url "https://api.github.com/repos/google/fonts/contents"/{ofl,apache}/$name
  else if contains -- '--nerdfonts' $argv
    set repo_url "https://api.github.com/repos/ryanoasis/nerd-fonts/contents/patched-fonts"/$name/{Light,Bold,Medium,Bold-Italic,Regular,Italic,Condensed,Regular,SemiCondensed}
  end

  echo $repo_url

  wget -q -O- $repo_url | grep '"download_url"' | sed 's/[",]//g;s/download_url://g;s/ *//' | grep 'ttf\|otf'
end
