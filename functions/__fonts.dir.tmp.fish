function __fonts.dir.tmp -a name
  test -z name; and return 1

  if set -l tmpdir (mktemp -q /tmp/$name.XXXXXX)

  else
    echo "Can't create a temporary directory!"
  end
end