set -o vi
PATH=$PATH:~/.bin

alias ctags="`brew --prefix`/bin/ctags"

alias ll='ls -l '
alias la='ls -la '

alias aws='docker run --rm -it -v ~/.aws:/root/.aws amazon/aws-cli '
alias node='docker run --rm -it --workdir /app -v $(pwd):/app -v /tmp:/tmp -e NODE_REPL_HISTORY=/tmp/.node_repl_history node:14.4-alpine '
alias npm='docker run --rm -it --workdir /app -v $(pwd):/app --entrypoint npm node:14.4-alpine '
alias terraform='docker run --rm -it --workdir /app -v $(pwd):/app -v ~/.aws:/root/.aws hashicorp/terraform:0.12.21 '

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
  local USAGE='Usage: gsquash commits message'
  local COMMITS=${1?"ERROR: expected a number of commits to squash. $USAGE"}
  local MESSAGE=${2?"ERROR: expected a squash-commit message. $USAGE"}

  if [ `echo $COMMITS | egrep -v '^[0-9]+$'` ]; then
    echo "ERROR: expected a number of commits to squash\n $USAGE"
    return 1
  fi

  if  ! git reset --soft HEAD~$COMMITS ||
      ! git commit -m "$MESSAGE"; then
    echo "gsquash utility failed"
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
alias gdb='git-delete-branch '
alias ga='git-add '
alias gc='git-commit '
alias gac='ga && gc '
