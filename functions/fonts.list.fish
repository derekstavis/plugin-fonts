function fonts.list -a option
  switch "$option"
  case '-a' '--available'
    __fonts.repo.list | column
  case '-i' '--installed' '*'
    count $FONTS_CONFIG/* >/dev/null;
      and basename -a $FONTS_CONFIG/* | column
      or echo "No font installed by this program"
  end
end
