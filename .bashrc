set -o vi
PATH=$PATH:~/.bin:~/aws-cli:/usr/local/go/bin

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
if ps -o command= $$| grep bash > /dev/null; then
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

if command -v brew &> /dev/null; then
  alias ctags="`brew --prefix`/bin/ctags"
fi

alias ll='ls -l '
alias la='ls -la '

function git-add {
  local FILES="$*"

  if [ -z "$FILES" ]; then
    FILES='.'
  fi

  git add $FILES
}

function git-commit {
  local MESSAGE=${1?"ERROR: expected a commit message to be defined. Usage: gc message [flags]"}
  shift
  local FLAGS=${*}

  git commit -m "$MESSAGE" $FLAGS
}

function git-squash {
  local USAGE='Usage: git-squash commits message'
  local COMMITS=${1?"ERROR: expected a number of commits to squash. $USAGE"}
  local MESSAGE=${2?"ERROR: expected a squash-commit message. $USAGE"}

  if [ `echo $COMMITS | egrep -v '^[0-9]+$'` ]; then
    echo "ERROR: expected a number of commits to squash\n $USAGE"
    return 1
  fi

  if  ! git reset --soft HEAD~$COMMITS ||
      ! git commit -m "$MESSAGE"; then
    echo "git-squash utility failed"
    return 1
  fi
}

function git-delete-branch {
  local BRANCHES="${@?'Expected a branch argument. Usage delete-branch branch [branches]'}"
  local BRANCH

  for BRANCH in "$BRANCHES"; do
    git branch -D $BRANCH
    git push --delete origin $BRANCH --no-verify
  done
}

alias gb='git branch -v'
alias gl='git log'
alias gs='git status'
alias gco='git checkout '
alias gcom='git checkout master '
alias gcod='git checkout develop '
alias gcob='git checkout -b '
alias gamd='git commit --amend '
alias gaamd='ga && gamd '
alias gsq='git-squash '
alias gp='git push '
alias gpo='git push origin '
alias gpof='git push origin -f '
alias gpom='git push origin master '
alias gpu='git push upstream '
alias gprum='git pull --rebase upstream master'
alias gprom='git pull --rebase origin master'
alias gprod='git pull --rebase origin develop'
alias gdb='git-delete-branch '
alias ga="git-add "
alias gc='git-commit '
alias gac='ga && gc '

alias dco='docker-compose '
alias dcou='docker-compose up '
alias dcoud='docker-compose up --detach '
alias dcoudr='docker-compose up --detach --force-recreate '
alias dcops='docker-compose ps '
alias dcod='docker-compose down '
alias dcol='docker-compose logs '
alias dcolf='docker-compose logs -f '
alias dcoe='docker-compose exec '

alias grep='grep --exclude-dir coverage --exclude-dir node_modules --exclude-dir .git --exclude-dir .terraform --exclude-dir tmp --exclude-dir build --exclude-dir .build --exclude-dir .webpack --exclude-dir .pyc --exclude-dir .serverless --exclude package-lock.json --exclude yarn.lock --exclude yarn-error.log --exclude *.swp '
