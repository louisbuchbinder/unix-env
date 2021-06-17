## Symlink the config files into `~`
```
for file in $(find $(pwd) -maxdepth 1 -mindepth 1 ! -name README.md ! -name .git ! -name .gitignore ! -name .DS_Store ! -name \*.swp); do
  if ! test -L ~/$(basename $file); then
    ln -s $file ~/$(basename $file)
  fi
done
```

## Install Xcode Select
```
# First install Xcode from the App Store
xcode-select --install
```

## Install Homebrew
- `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

## Install the Brew deps
- `brew install $(cat ~/.brewlist)`

## Install the Ruby deps
```
sudo bash
gem install $(cat ~/.gemlist)
```

## Install Docker
- `brew cask install docker`

## Install Java
- https://www.java.com/en/download/

## Install the aws cli
- https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html
- search for "To install and update for only the current user using the macOS command line"

## Install Android Studio
- https://developer.android.com/studio/

## Vim GraphQL Syntax Highlighting
```
mkdir -p ~/.vim/pack/jparise/start
cd ~/.vim/pack/jparise/start
git clone https://github.com/jparise/vim-graphql.git graphql
vim -u NONE -c "helptags graphql/doc" -c q
```

## Vim Typescript Syntax Highlighting
```
git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/typescript/start/typescript-vim
```

## JS Syntax Highlighting
```
mkdir -p ~/.vim/pack/vim-js/start
cd $_
git clone git@github.com:yuezk/vim-js.git
```

## JSX Syntax Highlighting
```
mkdir -p ~/.vim/pack/vim-jsx-pretty/start
cd $_
git clone git@github.com:MaxMEllon/vim-jsx-pretty.git
```

## TSX Syntax Highlighting
```
mkdir -p ~/.vim/pack/vim-jsx-typescript/start
cd $_
git clone git@github.com:peitalin/vim-jsx-typescript.git
```


## Cloudflare DNS
- Use cloudflare as the dns server: [https://1.1.1.1/dns/]()

## Text Edit
- Disable the app centric open panel:
```
defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false
```
- Set to "Plain text" in the preferences
