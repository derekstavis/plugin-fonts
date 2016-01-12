function __fonts.repo.urls -a name
  set repo_url

  if set index (contains -i -- '--powerline' $argv; or contains -i -- '--google' $argv)
    set name $argv
    set -e name[$index]
  end

  if contains -- '--powerline' $argv
    set repo_url "https://api.github.com/repos/powerline/fonts/contents"/$name
  else
    set repo_url "https://api.github.com/repos/google/fonts/contents"/{ofl,apache}/$name
  end

  wget -q -O- $repo_url | grep '"download_url"' | sed 's/[",]//g;s/download_url://g;s/ *//' | grep 'ttf\|otf'
end
