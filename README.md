## Symlink the config files into `~`
```
for file in $(find $(pwd) -maxdepth 1 -mindepth 1 ! -name README.md ! -name .git); do
  ln -s $file ~/$(basename $file)
done
```

## Install the aws cli
- https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html
- search for "To install and update for only the current user using the macOS command line"
