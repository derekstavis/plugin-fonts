set -g __github_repos_url 'https://api.github.com/repos'

function __fonts.repo.list.call -a url
  wget -q -O- $url | grep '"name"' | sed 's/[",]//g;s/name://g;s/^ *//;s/ *$//'
end

function __fonts.repo.google.list
  if not set -qg __fonts_repo_google_list
    set -l url $__github_repos_url/google/fonts/contents/{ofl,apache}
    set -g __fonts_repo_google_list (__fonts.repo.list.call $url)
  end

  printf '%s\n' $__fonts_repo_google_list
end

function __fonts.repo.powerline.list
  if not set -qg __fonts_repo_powerline_list
    set -l url $__github_repos_url/powerline/fonts/contents
    set -l ignore "samples\|README.rst\|install.ps1\|install.sh"
    set -g __fonts_repo_powerline_list (__fonts.repo.list.call $url | grep -v $ignore)
  end

  printf '%s\n' $__fonts_repo_powerline_list
end

function __fonts.repo.list
  contains -- '--powerline' $argv
    or __fonts.repo.google.list
  contains -- '--google' $argv
    or __fonts.repo.powerline.list
end
