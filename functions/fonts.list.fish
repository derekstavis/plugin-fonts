function fonts.list
  contains -- '-a' $argv; or contains -- '--available' $argv; and begin
    __fonts.repo.list $argv | column
    return $status
  end

  if not count $FONTS_CONFIG/* >/dev/null
    echo "No font installed by this program"
    return 1
  end

  __fonts.config.list $argv | column
end
