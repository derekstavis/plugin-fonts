function __fonts.repo.urls -a name
  set -l url 'https://api.github.com/repos/google/fonts/contents/'{ofl,apache}/$name
  wget -q -O- $url | grep '"download_url"' | sed 's/[",]//g;s/download_url://g;s/ *//' | grep 'ttf\|otf'
end
