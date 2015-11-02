function __fonts.repo.list
  set -l url 'https://api.github.com/repos/google/fonts/contents'/{ofl,apache}
  wget -q -O- $url | grep '"name"' | sed 's/[",]//g;s/name://g;s/^ *//;s/ *$//'
end
