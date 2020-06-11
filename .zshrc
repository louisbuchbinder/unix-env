bindkey -v
bindkey '^R' history-incremental-search-backward

set -o vi

alias ctags="`brew --prefix`/bin/ctags"

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
	local ARGS="$*"
	local MESSAGE=${1?"ERROR: expected a commit message to be defined. Usage: gc message [flags]"}
	local FLAGS=${ARGS:${#MESSAGE}}

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

	if 	! git reset --soft HEAD~$COMMITS ||
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
alias gdb='git-delete-branch '
alias ga='git-add '
alias gc='git-commit '
alias gac='ga && gc '
