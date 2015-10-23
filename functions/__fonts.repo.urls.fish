function __fonts.repo.urls
  cat $FONT_MOCK_SHOW | grep '"download_url"' | sed 's/[",]//g;s/download_url://g;s/ *//' | grep 'ttf\|otf'
end
