## Symlink the config files into `~`
```
for file in $(find $(pwd) -maxdepth 1 -mindepth 1 ! -name README.md ! -name .git); do
  ln -s $file ~/
done
```
