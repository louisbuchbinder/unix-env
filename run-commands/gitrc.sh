alias got='git '
alias gto='git '
alias gti='git '
alias gut='git '
alias gtu='git '
alias igt='git '
alias itg='git '
alias tgi='git '
alias tig='git '
alias gb='git branch -v'
alias gl='git log'
alias gs='git status'
alias gco='git checkout '
alias gcob='git checkout -b '
alias gamd='git commit --amend '
alias gp='git pull '
alias gprum='git pull --rebase upstream master'
alias gpo='push-origin '
alias gpof='gpo -f '

function ga {
	local FILES="$*"

	if [ -z "$FILES" ]; then
		FILES='.'
	fi

	git add $FILES
}

function gc {
	local ARGS="$*"
	local MESSAGE=${1?"ERROR: expected a commit message to be defined. Usage: gc message [flags]"}
	local ${ARGS:${#MESSAGE}}

	git commit -m "$MESSAGE" $FLAGS
}

function gsquash {
	local USAGE='Usage: gsquash commits message'
	local COMMITS=${1?"ERROR: expected a number of commits to squash. $USAGE"}
	local MESSAGE=${2?"ERROR: expected a squash-commit message. $USAGE"}

	if [ `echo $COMMITS | egrep -v '^[0-9]+$'` ]; then
		echo "ERROR: expected a number of commits to squash\n $USAGE"
		return 1
	fi

	if 	git reset --soft HEAD~$COMMITS &&
			git commit -m $MESSAGE; then
		echo "gsquash utility failed"
		return 1
	fi
}

function delete-branch {
	local BRANCHES="${@?'Expected a branch argument. Usage delete-branch branch [branches]'}"
	local BRANCH

	for BRANCH in "$BRANCHES"; do
		git branch -D $BRANCH
		git push --delete $BRANCH --no-verify
	done
}

function current-branch {
	local BRANCH=`git branch -v | grep '*'` # locate the current git branch labeled with the literal '*'
	if [ -z "$BRANCH" ]; then
		echo 'No current branch found'
		return 1
	fi

	BRANCH=${BRANCH/\*\ /} # trim the literal '* '
	BRANCH=${BRANCH%%\ *} # trim the longest match of " *" to the end
	echo $BRANCH
}

function commit-update {
	local FLAGS="$*"

	git commit -am update $FLAGS
}

function push-origin {
	local FLAGS="$*"
	local BRANCH=`current-branch`

	if [ -z "$BRANCH" ]; then
		echo 'No current branch found'
		return 1
	fi

	git push origin $BRANCH $FLAGS
}

function push-update {
	local FLAGS="$*"

	commit-update $FLAGS
	push-origin $FLAGS
}
