function __fonts.repo.list
  cat $FONT_MOCK_INDEX | grep '"name"' | sed 's/[",]//g;s/name://g;s/^ *//;s/ *$//'
end
