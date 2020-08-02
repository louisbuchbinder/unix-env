## Symlink the config files into `~`
```
for file in $(find $(pwd) -maxdepth 1 -mindepth 1 ! -name README.md ! -name .git); do
  ln -s $file ~/$(basename $file)
done
```

## Install Homebrew
- `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

## Install the Brew deps
- `brew install $(cat ~/.brewlist)`

## Install Docker
- `brew cask install docker`

## Install the aws cli
- https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html
- search for "To install and update for only the current user using the macOS command line"

## Vim GraphQL Syntax Highlighting
```
mkdir -p ~/.vim/pack/jparise/start
cd ~/.vim/pack/jparise/start
git clone https://github.com/jparise/vim-graphql.git graphql
vim -u NONE -c "helptags graphql/doc" -c q
```

## Cloudflare DNS
- Use cloudflare as the dns server: [https://1.1.1.1/dns/]()

## Text Edit
- Disable the app centric open panel:
```
defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false
```
- Set to "Plain text" in the preferences
